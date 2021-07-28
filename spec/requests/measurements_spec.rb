require 'rails_helper'

RSpec.describe 'Measurements Routes', type: :request do
  # Initialize test data

  # create_list method is a factory_bot gem method to generate dummy test data
  # factory_bot is setup in ./spec/factories/measurements.rb
  let!(:users) { create_list(:user, 1) }
  let!(:measurements) { create_list(:measurement, 20) }

  # Test suite for the POST /measurements route
  describe 'POST /measurements' do
    let(:valid_measurement) do
      {
        twitter: 23,
        instagram: 40,
        tiktok: 58,
        other: 46
      }
    end

    let(:invalid_measurement) do
      {
        twitter: 69,
        progress: 10
      }
    end

    context 'The request is valid' do
      before { post '/measurements', params: valid_measurement }

      it 'Should return status 201' do
        expect(response).to have_http_status(201)
      end

      it 'Should return the right message' do
        data = JSON.parse(response.body)['data']

        expect(data['twitter']).to eq(valid_measurement[:twitter])
        expect(data['instagram']).to eq(valid_measurement[:instagram])
        expect(data['tiktok']).to eq(valid_measurement[:tiktok])
        expect(data['other']).to eq(valid_measurement[:other])
      end
    end

    context 'The request is invalid' do
      before { post '/measurements', params: invalid_measurement }

      it 'Should return 400 status code' do
        expect(response).to have_http_status(400)
      end

      it 'Should return "Verify your input data and try again" message' do
        message = JSON.parse(response.body)['message']
        expect(message).to eq('Verify your input data and try again')
      end
    end
  end

  # Test suite for the GET /measurements route
  describe 'GET /measurements' do
    before { get '/measurements' }

    it 'Should return status 200' do
      expect(response).to have_http_status(200)
    end

    it 'Should return a data array' do
      response_data = JSON.parse(response.body)['data']
      expect(response_data.length).to eq(20)
    end
  end
end
