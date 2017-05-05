# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           default(""), not null
#  name                   :string
#  siape                  :integer
#  sector_id              :integer
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  context "model Validations" do
    it 'should be invalid if there is no mail' do
      user = FactoryGirl.build :user, email: nil
      expect(user).to be_invalid
    end

    it 'should be invalid if there is no password' do
      user = FactoryGirl.build :user, password: nil
      expect(user).to be_invalid
    end

    it 'should be invalid if there is no Sector association' do
      user = FactoryGirl.build :user, sector: nil
      expect(user).to be_invalid
    end

    it "object created is valid" do
      user = FactoryGirl.build(:user)
      expect(user).to be_valid
    end
  end
end
