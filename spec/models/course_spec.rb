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

  # Associations
  it { should have_many(:students) }

  # Methods
  describe "#names" do
    it "should return an array" do
      expect(Course.names).to be_an_instance_of(Array)

      Course.names.each do |name|
        expect(name).to be_an_instance_of(Array)
      end
    end
  end
end
