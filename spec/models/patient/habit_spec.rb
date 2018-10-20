# == Schema Information
#
# Table name: patient_habits
#
#  id                       :bigint(8)        not null, primary key
#  patient_id               :bigint(8)
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

RSpec.describe Patient::Habit, type: :model do

  # === Relations ===
  it { should belong_to :patient }

  # === Database (Columns) ===
  it { should have_db_column :id }
  it { should have_db_column :patient_id }
  it { should have_db_column :sleep_rest }
  it { should have_db_column :amount_sleep_hours }
  it { should have_db_column :physical_activity }
  it { should have_db_column :amount_physical_activity }
  it { should have_db_column :amount_fruit_vegetable }
  it { should have_db_column :amount_red_meat }
  it { should have_db_column :amount_white_meat }
  it { should have_db_column :amount_juice }
  it { should have_db_column :amount_water }
  it { should have_db_column :amount_tea }
  it { should have_db_column :other_information }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }

  # === Validations (Presence) ===
  # it { should validate_presence_of :patient }

  # === Enums ===
  it { should define_enum_for(:sleep_rest).with(["Alterado", "Satisfatório"]) }

end
