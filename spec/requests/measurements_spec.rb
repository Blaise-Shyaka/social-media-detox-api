require 'rails_helper'

RSpec.describe 'Measurements Routes', type: :request do
  # Initialize test data
  let!(:measurements){ create_list(:measurement, 20) }

  # Test suite for the POST /measurements route
  describe 'POST /measurements' do
    let(:measurement) { { platform: 'Twitter', time_spent: 45 } }

    context 'The request is valid' do
      before { post '/measurements', params: measurement }

      it 'Should return status 201' do
        expect(response).to_have_http_status(201)
      end

      it 'Should return the right message' do
        expect(response.body.message).to_eq('Measurement added successfully')
      end
    end
  end

  # Test suite for the GET /measurements route
  describe 'GET /measurements' do
    before {get '/measurements'}

    it "Should return status 200" do
      expect(response).to_have_http_status(200)
    end

    it "Should return a data array" do
      expect(response.body.data.length).to_eq(20)
    end
  end 
end
