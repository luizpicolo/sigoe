# == Schema Information
#
# Table name: school_groups
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe SchoolGroup, type: :model do
  # === Relations ===
  it { should have_many :incidents }

  # === Database (Columns) ===
  it { should have_db_column :id }
  it { should have_db_column :name }
  it { should have_db_column :identifier }

  # === Validations (Presence) ===
  it { should validate_presence_of :name }
  it { should validate_presence_of :identifier }

  describe ".ordenation_attributes" do
    ordenation_attributes = SchoolGroup.ordenation_attributes

    it "should return an array" do
      expect(ordenation_attributes).to be_an_instance_of(Array)

      ordenation_attributes.each do |attribute|
        expect(attribute).to be_an_instance_of(Array)
      end
    end

    ordenation_attributes.each do |attribute|
      it "should return user attribute #{attribute}" do
        expect(SchoolGroup.attribute_names.include?(attribute.last)).to be true
      end
    end
  end
end
