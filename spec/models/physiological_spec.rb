# == Schema Information
#
# Table name: physiologicals
#
#  id                    :integer          not null, primary key
#  patient_id            :integer
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

RSpec.describe Physiological, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
