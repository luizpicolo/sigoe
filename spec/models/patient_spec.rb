# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Patient, type: :model do

  # === Relations ===
  it { is_expected.to belong_to :student }
  it { is_expected.to have_many :habits }
  it { is_expected.to have_many :morbids }

  # === Nested Attributes ===
  it { is_expected.to accept_nested_attributes_for :habits }
  it { is_expected.to accept_nested_attributes_for :morbids }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :student_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :student }
end
