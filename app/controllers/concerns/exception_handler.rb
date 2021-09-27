module ExceptionHandler
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches `StandardErrors`
  class AuthenticationError < StandardError; end

  class MissingToken < StandardError; end

  class InvalidToken < StandardError; end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
  end

  private

  # JSON response with message; Status code 422 - unprocessable entity
  def four_twenty_two(error)
    render json: { status: :unprocessable_entity, message: error.message }, status: :unprocessable_entity
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(error)
    render json: { status: :unauthorized, message: error.message }, status: :unauthorized
  end
end
