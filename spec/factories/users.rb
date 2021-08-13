FactoryBot.define do
  factory :user do
    name { 'User_test' }
    lastname { 'Test' }
    email { 'usertest@test.com' }
    password_digest { 123_456 }
  end
end
