# frozen_string_literal: true

# == Schema Information
#
# Table name: polos
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  institution_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  inicial        :string
#

require 'rails_helper'

RSpec.describe Polo, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end