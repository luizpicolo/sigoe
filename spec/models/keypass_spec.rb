# == Schema Information
#
# Table name: keypasses
#
#  id            :integer          not null, primary key
#  title         :string
#  key           :string
#  local_service :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user          :string
#  local         :integer
#

require 'rails_helper'

RSpec.describe Keypass, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
