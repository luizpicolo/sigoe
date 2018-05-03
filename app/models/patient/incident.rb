class Patient::Incident < ApplicationRecord
  enum medical_referral: ['Hospital', 'ESF', 'Família', 'Psicóloga']
  enum nursing_conduct: ['Orientações', 'Observação', 'Encaminhamentos']
end
