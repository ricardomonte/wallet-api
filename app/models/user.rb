class User < ApplicationRecord
  has_secure_password
  has_one :account, dependent: :delete
  has_many :transactions, dependent: :destroy
  validates_presence_of :name, :lastname, :email, :password_digest

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_format_of :email, with: VALID_EMAIL_REGEX
end
