class Transaction < ApplicationRecord
  belongs_to :user
  validates_presence_of :coin_to_send, :coin_to_receive, :amount_send, :amount_receive, :user_id
end
