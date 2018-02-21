# == Schema Information
#
# Table name: habits
#
#  id                       :integer          not null, primary key
#  patient_id               :integer
#  sleep_rest               :integer
#  amount_sleep_hours       :integer
#  physical_activity        :integer
#  amount_physical_activity :integer
#  amount_fruit_vegetable   :integer
#  amount_red_meat          :integer
#  amount_white_meat        :integer
#  amount_juice             :integer
#  amount_water             :integer
#  amount_tea               :integer
#  other_information        :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'rails_helper'

RSpec.describe Habit, type: :model do

  # === Relations ===
  it { is_expected.to belong_to :patient }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :patient_id }
  it { is_expected.to have_db_column :sleep_rest }
  it { is_expected.to have_db_column :amount_sleep_hours }
  it { is_expected.to have_db_column :physical_activity }
  it { is_expected.to have_db_column :amount_physical_activity }
  it { is_expected.to have_db_column :amount_fruit_vegetable }
  it { is_expected.to have_db_column :amount_red_meat }
  it { is_expected.to have_db_column :amount_white_meat }
  it { is_expected.to have_db_column :amount_juice }
  it { is_expected.to have_db_column :amount_water }
  it { is_expected.to have_db_column :amount_tea }
  it { is_expected.to have_db_column :other_information }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :patient }

  # === Enums ===
  it { is_expected.to define_enum_for(:sleep_rest).with(["Alterado", "Satisfatório"]) }

end
