FactoryBot.define do
  factory :transaction do
    coin_to_send { "MyString" }
    coin_to_receive { "MyString" }
    amount_send { "100" }
    amount_receive { "0.2" }
    user_id { 1 }
  end
end
