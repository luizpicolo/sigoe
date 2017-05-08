# == Schema Information
#
# Table name: keypasses
#
#  id            :integer          not null, primary key
#  title         :string
#  key           :string
#  local_service :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user          :string
#  local         :integer
#

require 'rails_helper'

RSpec.describe Keypass, type: :model do
  before(:each) do
    @keypass = FactoryGirl.create(:keypass)
  end

  # Validations
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }

  # Enuns
  it { should define_enum_for(:local) }

  describe '#search' do
    it "find user by title" do
      expect(Keypass.search(@keypass.title)).to eq([@keypass])
    end
  end
end
