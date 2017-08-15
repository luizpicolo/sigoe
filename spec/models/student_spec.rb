# == Schema Information
#
# Table name: students
#
#  id                  :integer          not null, primary key
#  name                :string
#  course_id           :integer
#  photo               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  responsible         :string
#  responsible_contact :string
#  contact             :string
#  ra                  :integer
#  password            :string
#  password_digest     :string
#  enrollment          :string
#  cpf                 :string
#  birth_date          :date
#  course_situation    :integer
#

require 'rails_helper'

RSpec.describe Student, type: :model do
  before(:each) do
    @student = FactoryGirl.create(:student)
  end

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:course) }
  it { should validate_presence_of(:ra) }

  # Columns
  it { should have_db_column :id }
  it { should have_db_column :name }
  it { should have_db_column :course_id }
  it { should have_db_column :responsible }
  it { should have_db_column :responsible_contact }
  it { should have_db_column :contact }
  it { should have_db_column :photo }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }

  # Indexes
  it { should have_db_index ["course_id"] }
  it { should have_db_index ["name"] }

  # Delegats
  it { should delegate_method(:name).to(:course).with_prefix }
  it { should delegate_method(:initial).to(:course).with_prefix }

  describe ".ordenation_attributes" do
    ordenation_attributes = Student.ordenation_attributes

    it "should return an array" do
      expect(ordenation_attributes).to be_an_instance_of(Array)

      ordenation_attributes.each do |attribute|
        expect(attribute).to be_an_instance_of(Array)
      end
    end

    ordenation_attributes.each do |attribute|
      it "should return user attribute #{attribute}" do
        expect(Student.attribute_names.include?(attribute.last)).to be true
      end
    end
  end

  describe "#get_all" do
    it "should return an array" do
      @student = Student.get_all
      expect(@student).to be_an_instance_of(Array)

      @student.each do |student|
        expect(student[0]).to be_kind_of(String)
        expect(student[1]).to be_kind_of(Integer)
      end
    end
  end

  describe '#search' do
    it "find user by name" do
      expect(Student.search(@student.name)).to eq([@student])
    end

    it "find user by initial of course" do
      expect(Student.search(@student.course_name)).to eq([@student])
    end
  end
end
