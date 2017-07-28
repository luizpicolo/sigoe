# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  initial    :string
#

require 'rails_helper'

RSpec.describe Course, type: :model do
  before(:each) do
    @course = FactoryGirl.create(:course)
  end

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:initial) }

  # Columns
  it { should have_db_column :id }
  it { should have_db_column :name }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }
  it { should have_db_column :initial }

  # Indexes
  it { should have_db_index ["name", "initial"] }

  # Associations
  it { should have_many(:students) }

  # Methods
  ['names', 'initials'].each do |method|
    describe "##{method}" do
      it "should return an array" do
        expect(Course.method(method).call).to be_an_instance_of(Array)

        Course.method(method).call.each do |name|
          expect(name).to be_an_instance_of(Array)
        end
      end
    end
  end

  describe ".ordenation_attributes" do
    ordenation_attributes = Course.ordenation_attributes

    it "should return an array" do
      expect(ordenation_attributes).to be_an_instance_of(Array)

      ordenation_attributes.each do |attribute|
        expect(attribute).to be_an_instance_of(Array)
      end
    end

    ordenation_attributes.each do |attribute|
      it "should return user attribute #{attribute}" do
        expect(Course.attribute_names.include?(attribute.last)).to be true
      end
    end
  end

  describe "#params_search" do
    it "should return an hash" do
      expect(@course.params_search).to be_an_instance_of(Hash)
    end

    it "should return hash key name with valeu name" do
      expect(@course.params_search[:order]).to eq('name')
    end

    it "should return hash key 'return' with valeu > 0" do
      expect(@course.params_search[:return]).to be > 0
    end

    it "should return hash key 'return' with initial valeu course" do
      expect(@course.params_search[:search]).to eql(@course.initial.downcase)
    end
  end
end
