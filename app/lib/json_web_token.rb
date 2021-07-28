# This class will be used to encode and decode users's passwords based on a secret key
class JsonWebToken
  # Each rails application has a unique ID. We will use it as our secret key
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    # Set expiry date of the token
    payload[:exp] = exp.to_i

    # Sign token
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY)[0]

    # It enables to access hash properties using both a symbol Hash[:prop] and a Hash['prop']
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, e.message
  end
end
