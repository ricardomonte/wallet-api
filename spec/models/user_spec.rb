require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test validations for user model' do
    subject { build(:user) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:lastname) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should allow_value('test@test.com').for(:email) }
    it { should have_secure_password }
  end

  describe 'it will test the associations' do
    it { should have_many(:transactions) }
    it { should have_one(:account) }
  end
end
