require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  # Create test user
  let(:user) { create(:user) }

  # Mock `Authorization` header
  let(:header) { { 'Authorization' => token_generator(user.id) } }

  # Invalid request object
  subject(:invalid_request_obj) { described_class.new({}) }

  # Valid request object
  subject(:request_obj) { described_class.new(header) }

  describe '#call' do
    context 'When valid request' do
      it 'returns user object' do
        result = request_obj.call
        expect(result[:user]).to eq(user)
      end
    end

    context 'When invalid request' do
      context 'When missing token' do
        it 'raises a MissingToken error' do
          expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::MissingToken, 'Missing token')
        end
      end

      context 'When invalid token' do
        subject(:invalid_request_obj) do
          # custom helper method `token_generator`
          described_class.new('Authorization' => token_generator(5))
        end

        it 'raises an InvalidToken error' do
          expect { invalid_request_obj.call }.to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
        end
      end

      context 'When expired token' do
        let(:header) { { 'Authorization' => expired_token_generator(user.id) } }
        subject(:request_obj) { described_class.new(header) }

        it 'raises ExceptionHandler::ExpiredSignature error' do
          expect { request_obj.call }.to raise_error(ExceptionHandler::InvalidToken, /Signature has expired/)
        end
      end

      context 'Fake token' do
        let(:header) { { 'Authorization' => 'foobar' } }
        subject(:invalid_request_obj) { described_class.new(header) }

        it 'handles JWT::DecodeError' do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::InvalidToken, /Not enough or too many segments/)
        end
      end
    end
  end
end
