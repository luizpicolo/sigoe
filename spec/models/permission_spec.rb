# frozen_string_literal: true

# == Schema Information
#
# Table name: permissions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  entity      :string
#  can_create  :boolean          default("false")
#  can_read    :boolean          default("false")
#  can_update  :boolean          default("false")
#  can_destroy :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  can_manage  :boolean          default("false")
#  can_extras  :boolean          default("false")
#

require 'rails_helper'

RSpec.describe Permission, type: :model do
  # === Relations ===
  it { should belong_to :user }

  # === Database (Columns) ===
  it { should have_db_column :id }
  it { should have_db_column :user_id }
  it { should have_db_column :entity }
  it { should have_db_column :can_create }
  it { should have_db_column :can_read }
  it { should have_db_column :can_read_restricted }
  it { should have_db_column :can_update }
  it { should have_db_column :can_destroy }
  it { should have_db_column :created_at }
  it { should have_db_column :updated_at }
  it { should have_db_column :can_manage }
  it { should have_db_column :can_extras }

  # === Validations (Presence) ===
  it { should validate_presence_of :user }
end
