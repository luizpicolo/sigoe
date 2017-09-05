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
#

require 'rails_helper'

RSpec.describe Permission, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
