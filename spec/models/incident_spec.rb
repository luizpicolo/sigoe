# == Schema Information
#
# Table name: incidents
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  user_id       :integer
#  institution   :integer
#  description   :text
#  date_incident :date
#  soluction     :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  course_id     :integer
#  time_incident :time
#  assistant_id  :integer
#

require 'rails_helper'

RSpec.describe Incident, type: :model do
  before(:each) do
    @incident = FactoryGirl.create :incident
  end

  # Validations
  it { should validate_presence_of :user  }
  it { should validate_presence_of :institution  }
  it { should validate_presence_of :description  }
  it { should validate_presence_of :assistant  }
  it { should validate_presence_of :date_incident  }
  it { should validate_presence_of :time_incident  }

  # Columns
  it { should have_db_column :id }
  it { should have_db_column :student_id }
  it { should have_db_column :user_id }
  it { should have_db_column :assistant_id }
  it { should have_db_column :course_id }
  it { should have_db_column :institution }
  it { should have_db_column :date_incident }
  it { should have_db_column :time_incident }
  it { should have_db_column :soluction }
  it { should have_db_column :description }

  # Indexes
  it { should have_db_index ["student_id"] }
  it { should have_db_index ["user_id"] }
  it { should have_db_index ["institution"] }
  it { should have_db_index ["date_incident"] }

  # Associations
  it { should belong_to(:student) }
  it { should belong_to(:assistant) }
  it { should belong_to(:user) }
  it { should belong_to(:course) }

  # Enums
  it { should define_enum_for(:institution).with(["ifms", "ufms", "cemid"]) }

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
