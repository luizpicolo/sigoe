# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  course_id  :integer
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Student, type: :model do
  before(:each) do
    @student = FactoryGirl.create(:student)
  end

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:course) }

  # Delegats
  it { should delegate_method(:name).to(:course).with_prefix }
  it { should delegate_method(:initial).to(:course).with_prefix }

  describe '#search' do
    it "find user by name" do
      expect(Student.search(@student.name)).to eq([@student])
    end

    it "find user by initial of course" do
      expect(Student.search(@student.course_initial)).to eq([@student])
    end
  end
end
