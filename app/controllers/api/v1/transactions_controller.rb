class Api::V1::TransactionsController < ApplicationController
  before_action do 
    authentication_cookie
  end

  def index
    transaction = Transaction.where(user_id: current_user.id)
    if transaction
      render json: { transactions: transaction }
    else
      render json: {message: "Get transactions failed"}
    end
  end

  def create
    transaction = Transaction.create(params_transaction)
    account = Account.find_by(user_id: current_user)
    if transaction.save
      if transaction.coin_to_send == 'USD'
        Account.update(amount_usd: account.amount_usd - transaction.amount_send)
        Account.update(amount_btc: account.amount_btc + transaction.amount_receive)
      else
        Account.update(amount_btc: account.amount_btc - transaction.amount_send)
        Account.update(amount_usd: account.amount_usd + transaction.amount_receive)
        
      end
      render json: { message: 'transaction successed' }
    else
      render json: { message: 'transaction failed' }  
    end
  end

  private

  def params_transaction
    params.require(:transaction).permit(:coin_to_send, :coin_to_receive, :amount_send, :amount_receive, :user_id)
  end
end
