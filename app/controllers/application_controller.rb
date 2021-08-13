class ApplicationController < ActionController::API

  def not_found
    render json: {error: 'not found'}
  end


  def authorize_request
    header = request.header['Authorization']
    header = header.split(' ').last if header
    begin
      JsonWebToken.decode(header)
    rescue ActiveRecord::RecordNotFound => e
      render json: {errors: e.message}, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: {errors: e,message}, status: :unauthorized
    end
  end
  
  def current_user
    header = request.header['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)
    if decoded
      user = User.find_by(id: decoded[0]['user_id'])
    end
    if user then return user else return false end
  end

end
