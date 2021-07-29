#  This controller will handle POST /signup

class UsersController < ApplicationController
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = {
      status: :created,
      data: { message: Message.account_created, auth_token: auth_token }
    }
    render json: response, status: :created
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
