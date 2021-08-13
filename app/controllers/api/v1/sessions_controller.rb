class Api::V1::SessionsController < ApplicationController
  before_action only: [:destroy] do
    authentication_cookie
  end

  def create
    email = params['email']
    password = params['password']
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      auth_token = JsonWebToken.encode({user_id: user.id})
      cookies.signed[:jwt] = {value:  auth_token, httponly: true}
      cookies.signed[:user] = {value: "#{user.name} #{user.lastname}"}
      response = {message: 'Sign in successful'}
      render json: response
    else
      response = {message: 'User not found'}
      render json: response, status: :bad_request
    end
  end

  def destroy
    user = current_user
    if user
      cookies.delete(:jwt)
      cookies.delete(:user)
      render json: {status: 'OK', code: 200}
    else
      render json: {status: 'Sesion not found', code: 401}
    end    
  end
end
