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

  # Methods
  describe ".ordenation_attributes" do
    ordenation_attributes = Keypass.ordenation_attributes

    it "should return an array" do
      expect(ordenation_attributes).to be_an_instance_of(Array)

      ordenation_attributes.each do |attribute|
        expect(attribute).to be_an_instance_of(Array)
      end
    end

    ordenation_attributes.each do |attribute|
      it "should return user attribute #{attribute}" do
        expect(Keypass.attribute_names.include?(attribute.last)).to be true
      end
    end
  end

  describe '#search' do
    it "find user by title" do
      expect(Keypass.search(@keypass.title)).to eq([@keypass])
    end
  end
end
