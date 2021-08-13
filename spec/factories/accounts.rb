FactoryBot.define do
  factory :account do
    amount_usd { "9.99" }
    amount_btc { "9.99" }
    user_id { 1 }
  end
end
