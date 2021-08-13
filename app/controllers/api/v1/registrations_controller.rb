class Api::V1::RegistrationsController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      acc = Account.create(user_id: user.id)
      auth_token = JsonWebToken.encode({user_id: user.id})
      cookies.signed[:jwt] = {value: auth_token, httponly: true}
      cookies.signed[:user] = {value: "#{user.name} #{user.lastname}"}
      response = {message: 'User successfully created'}
      render json: response
    else
      response = {message: 'User couldnt be created'}
      render json: response, status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:name, :lastname, :email, :password)
  end
end
