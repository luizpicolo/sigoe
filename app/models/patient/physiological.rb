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

class Patient::Physiological < ApplicationRecord
end
