# == Schema Information
#
# Table name: type_incidents
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  old_id     :integer
#

# frozen_string_literal: true

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
