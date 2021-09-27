# Login requests will be dealt by this controller

class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: :authenticate

  # return auth token once user is authenticated
  def authenticate
    auth_token =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    render json: { status: :ok, auth_token: auth_token }, status: :ok
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
