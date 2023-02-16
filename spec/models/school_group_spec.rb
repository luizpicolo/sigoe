# frozen_string_literal: true

# == Schema Information
#
# Table name: school_groups
#
#  id         :integer          not null, primary key
#  name       :string
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  polo_id    :integer
#  old_id     :integer
#

require 'rails_helper'

RSpec.describe SchoolGroup, type: :model do
  # === Database (Columns) ===
  it { should have_db_column :id }
  it { should have_db_column :name }
  it { should have_db_column :identifier }

  # === Validations (Presence) ===
  it { should validate_presence_of :name }
  it { should validate_presence_of :identifier }

  describe '.identifiers' do
    it 'orders by identifier ascending and returns an array of [identifier, id] pairs' do
      # create some test objects with different identifiers
      object1 = FactoryBot.create(:school_group, identifier: 'group1')
      object3 = FactoryBot.create(:school_group, identifier: 'group3')
      object2 = FactoryBot.create(:school_group, identifier: 'group2')

      # call the method and check the result
      result = described_class.identifiers
      expect(result).to eq([['group1', object1.id], ['group2', object2.id], ['group3', object3.id]])
    end
  end

  describe '.ordenation_attributes' do
    ordenation_attributes = described_class.ordenation_attributes

    it 'should return an array' do
      expect(ordenation_attributes).to be_an_instance_of(Array)

      ordenation_attributes.each do |attribute|
        expect(attribute).to be_an_instance_of(Array)
      end
    end

    ordenation_attributes.each do |attribute|
      it "should return user attribute #{attribute}" do
        expect(described_class.attribute_names.include?(attribute.last)).to be true
      end
    end
  end
end
