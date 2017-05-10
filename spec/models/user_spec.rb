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

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  # Validations
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:sector) }
  it { should validate_presence_of(:username) }

  # Associations
  it { should belong_to(:sector) }

  # Methods
  describe '#it_is_part_of_the_sector?' do
    it 'return true if the sector is currect' do
      expect(@user.it_is_part_of_the_sector?('serti')).to eq(true)
    end

    it 'return false if the sector is not currect' do
      expect(@user.it_is_part_of_the_sector?('wrong_sector')).to eq(false)
    end
  end

  describe '#search' do
    it "find user by name" do
      expect(User.search(@user.name)).to eq([@user])
    end

    it "find user by email" do
      expect(User.search(@user.email)).to eq([@user])
    end

    it "find user by sector" do
      expect(User.search(@user.sector.initial)).to eq([@user])
    end
  end
end
