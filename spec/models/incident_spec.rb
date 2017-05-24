require 'rails_helper'

RSpec.describe Incident, type: :model do
  before(:each) do
    @user = FactoryGirl.create :user
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

  # Associations
  it { should belong_to(:student) }
  it { should belong_to(:user) }

  # Enums
  it { should define_enum_for(:local).with(["ifms", "ufms"]) }
end
