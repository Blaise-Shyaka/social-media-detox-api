class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authorize_request, :cors_preflight_check
  after_action :cors_set_access_control_headers
  attr_reader :current_user

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
