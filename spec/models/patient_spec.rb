# == Schema Information
#
# Table name: patients
#
#  id         :bigint(8)        not null, primary key
#  student_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Patient, type: :model do

  # === Relations ===
  it { should belong_to :student }
  it { should have_many :habits }
  it { should have_many :morbids }
  it { should have_many :physiologicals }
  it { should have_many :appointments }

  # === Nested Attributes ===
  it { should accept_nested_attributes_for :habits }
  it { should accept_nested_attributes_for :morbids }
  it { should accept_nested_attributes_for :physiologicals }

  # === Validations (Presence) ===
  it { should validate_presence_of :student }
  it { should validate_presence_of :habits }
  it { should validate_presence_of :physiologicals }
  it { should validate_presence_of :morbids }
  it { should validate_presence_of :student }

  # === Validations (Presence) ===
  it { should validate_presence_of :student }
end
