require 'rails_helper'

RSpec.describe Incident::TypeIncident, type: :model do
  # Validations
  it { should validate_presence_of :name }

  # Columns
  it { should have_db_column :id }
  it { should have_db_column :name }
  
  # === Relations ===
  it { should have_many(:incidents) }
end
