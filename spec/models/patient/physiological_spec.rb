# == Schema Information
#
# Table name: patient_physiologicals
#
#  id                    :bigint(8)        not null, primary key
#  patient_id            :bigint(8)
#  other_diseases        :text
#  continuing_medication :text
#  previous_surgeries    :text
#  hospitalization       :text
#  first_menstruation    :text
#  complaints            :text
#  gestation             :text
#  children              :text
#  abortion              :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'rails_helper'

RSpec.describe Patient::Physiological, type: :model do
  # === Database (Columns) ===
  it { should have_db_column :id }
  it { should have_db_column :patient_id }
  it { should have_db_column :other_diseases }
  it { should have_db_column :continuing_medication }
  it { should have_db_column :previous_surgeries }
  it { should have_db_column :hospitalization }
  it { should have_db_column :first_menstruation }
  it { should have_db_column :complaints }
  it { should have_db_column :gestation }
  it { should have_db_column :children }
  it { should have_db_column :abortion }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }

  # === Database (Indexes) ===
  it { should have_db_index ["patient_id"] }
end
