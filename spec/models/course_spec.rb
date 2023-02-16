# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  initial    :string
#  polo_id    :integer
#

require 'rails_helper'

RSpec.describe Course, type: :model do
  before(:each) do
    @course = FactoryBot.create(:course)
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
  it { should have_db_index %w[name initial] }

  # Associations
  it { should have_many(:students) }
  it { should have_one :coordinator }

  # Methods
  %w[names initials].each do |method|
    describe "##{method}" do
      it 'should return an array' do
        expect(Course.method(method).call(polo: @course.polo_id)).to be_an_instance_of(Array)

        Course.method(method).call(polo: @course.polo_id).each do |name|
          expect(name).to be_an_instance_of(Array)
        end
      end
    end
  end

  describe '.ordenation_attributes' do
    ordenation_attributes = Course.ordenation_attributes

    it 'should return an array' do
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

  describe '#params_search' do
    it 'returns a hash' do
      expect(@course.params_search).to be_a(Hash)
    end

    it 'sets the order key to "id"' do
      expect(@course.params_search[:order]).to eq('id')
    end

    it 'sets the return key to a positive integer' do
      expect(@course.params_search[:return]).to be > 0
    end

    it 'sets the search key to the downcased initial value of the course' do
      expect(@course.params_search[:search]).to eq(@course.initial.downcase)
    end
  end
end
