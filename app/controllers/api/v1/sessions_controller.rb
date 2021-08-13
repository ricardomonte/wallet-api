class Api::V1::SessionsController < ApplicationController
  before_action only: [:destroy] do
    authorize_request
  end

  def create
    email = params['email']
    password = params['password']
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      auth_token = JsonWebToken.encode({user_id: user.id})
      response = {message: 'Sign in successful', token: auth_token}
      render json: response
    else
      response = {message: 'User not found'}
      render json: response, status: :bad_request
    end
  end
end
