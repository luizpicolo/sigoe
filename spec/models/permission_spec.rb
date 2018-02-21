# == Schema Information
#
# Table name: permissions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  entity      :string
#  can_create  :boolean          default(FALSE)
#  can_read    :boolean          default(FALSE)
#  can_update  :boolean          default(FALSE)
#  can_destroy :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  can_manage  :boolean          default(FALSE)
#  can_extras  :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Permission, type: :model do
  # === Relations ===
  it { is_expected.to belong_to :user }

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :user_id }
  it { is_expected.to have_db_column :entity }
  it { is_expected.to have_db_column :can_create }
  it { is_expected.to have_db_column :can_read }
  it { is_expected.to have_db_column :can_update }
  it { is_expected.to have_db_column :can_destroy }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :can_manage }
  it { is_expected.to have_db_column :can_extras }

  # === Validations (Presence) ===
  it { is_expected.to validate_presence_of :user }
end
