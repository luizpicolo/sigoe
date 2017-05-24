# == Schema Information
#
# Table name: incidents
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  user_id       :integer
#  local         :integer
#  description   :text
#  date_incident :date
#  soluction     :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Incident, type: :model do
  before(:each) do
    @incident = FactoryGirl.create :incident
  end

  # Validations
  it { should validate_presence_of :student }
  it { should validate_presence_of :user  }
  it { should validate_presence_of :local  }
  it { should validate_presence_of :description  }
  it { should validate_presence_of :date_incident  }

  # Columns
  it { should have_db_column :id }
  it { should have_db_column :student_id }
  it { should have_db_column :user_id }
  it { should have_db_column :local }
  it { should have_db_column :description }
  it { should have_db_column :date_incident }
  it { should have_db_column :soluction }

  # Indexes
  it { should have_db_index ["student_id"] }
  it { should have_db_index ["user_id"] }
  it { should have_db_index ["local"] }
  it { should have_db_index ["date_incident"] }

  # Delegats
  it { should delegate_method(:name).to(:student).with_prefix }

  # Associations
  it { should belong_to(:student) }
  it { should belong_to(:user) }

  # Enums
  it { should define_enum_for(:local).with(["ifms", "ufms"]) }

  # Methods
  describe '#search' do
    it "find student by student" do
      expect(Incident.search(@incident.student_name)).to eq([@incident])
    end
  end

  describe ".ordenation_attributes" do
    ordenation_attributes = Incident.ordenation_attributes

    it "should return an array" do
      expect(ordenation_attributes).to be_an_instance_of(Array)

      ordenation_attributes.each do |attribute|
        expect(attribute).to be_an_instance_of(Array)
      end
    end

    ordenation_attributes.each do |attribute|
      it "should return user attribute #{attribute}" do
        if attribute.last != 'student_name'
          expect(Incident.attribute_names.include?(attribute.last)).to be true
        end
      end
    end
  end
end
