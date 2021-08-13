class Api::V1::AccountsController < ApplicationController
  before_action do 
    authentication_cookie
  end

  def index
    account = Account.find_by(user_id: current_user.id)
    render json: {accounts: account}
  end
end
