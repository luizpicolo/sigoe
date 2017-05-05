# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  from        :string
#  to          :string
#  subject     :string
#  priority    :integer          default("0")
#  description :text
#  status      :integer          default("0")
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  local       :integer
#  answer      :integer
#

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
