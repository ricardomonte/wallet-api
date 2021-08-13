class Account < ApplicationRecord
  require 'rest-client'

  belongs_to :user, dependent: :delete
  validates_presence_of :amount_usd, :amount_btc, :user_id

  def as_json(options = nil)
    hash = super(:include => {:user => {:except => [:password_digest, :created_at, :updated_at]}})
    hash[:value_btc] = value_btc
    return hash
  end

  def value_btc
    url = "https://api.coindesk.com/v1/bpi/currentprice.json"
    response = RestClient.get(url)
    return JSON.parse(response)
  end
end
