# == Schema Information
#
# Table name: positions
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Position, type: :model do
  before(:each) do
    @position = FactoryBot.create :position
  end

  # Validations
  it { should validate_presence_of :name }

  # Columns
  it { should have_db_column :id }
  it { should have_db_column :name }

  # Indexes
  it { should have_db_index ["name"] }

  describe ".ordenation_attributes" do
    ordenation_attributes = Position.ordenation_attributes

    it "should return an array" do
      expect(ordenation_attributes).to be_an_instance_of(Array)

      ordenation_attributes.each do |attribute|
        expect(attribute).to be_an_instance_of(Array)
      end
    end

    ordenation_attributes.each do |attribute|
      it "should return user attribute #{attribute}" do
        expect(Position.attribute_names.include?(attribute.last)).to be true
      end
    end
  end

  describe "#get_all" do
    it "should return an array" do
      @positions = Position.get_all
      expect(@positions).to be_an_instance_of(Array)

      @positions.each do |position|
        expect(position[0]).to be_kind_of(String)
        expect(position[1]).to be_kind_of(Integer)
      end
    end
  end
end
