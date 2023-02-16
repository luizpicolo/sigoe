# frozen_string_literal: true

# == Schema Information
#
# Table name: institutions
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Institution, type: :model do
  # Associations
  it { should have_many(:polos) }
end
