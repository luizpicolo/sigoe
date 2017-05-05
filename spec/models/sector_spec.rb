# == Schema Information
#
# Table name: sectors
#
#  id         :integer          not null, primary key
#  name       :string
#  initial    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  icon       :string
#

require 'rails_helper'

RSpec.describe Sector, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
