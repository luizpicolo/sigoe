require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Validations" do
    it 'should be invalid if there is no mail' do
      user = FactoryGirl.build :user, :email => nil
      expect(user).to be_invalid
    end

    it 'should be invalid if there is no password' do
      user = FactoryGirl.build :user, :password => nil
      expect(user).to be_invalid
    end

    it "object created is valid" do
      user = FactoryGirl.build(:user)
      expect(user).to be_valid
    end
  end
end
