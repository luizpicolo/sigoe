# == Schema Information
#
# Table name: student_duties
#
#  id         :integer          not null, primary key
#  item       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Incident::StudentDuty, type: :model do
  # Validations
  it { should validate_presence_of :item }

  # Columns
  it { should have_db_column :id }
  it { should have_db_column :item }

  # === Relations ===
  it { should have_and_belong_to_many(:incidents) }
end
