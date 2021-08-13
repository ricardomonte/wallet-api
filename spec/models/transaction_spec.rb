require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'Test validations for transaction model' do
    subject { build(:transaction) }
    it { should validate_presence_of(:coin_to_send) }
    it { should validate_presence_of(:coin_to_receive) }
    it { should validate_presence_of(:amount_send) }
    it { should validate_presence_of(:amount_receive) }
    it { should validate_presence_of(:user_id) }
  end

  describe 'it will test the associations' do
    it { should belong_to(:user) }
  end
end
