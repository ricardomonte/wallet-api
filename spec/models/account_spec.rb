require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'Test validations for account model' do
    subject { build(:account) }
    it { should validate_presence_of(:amount_usd) }
    it { should validate_presence_of(:amount_btc) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'it will test the associations' do
    it { should belong_to(:user) }
  end
end
