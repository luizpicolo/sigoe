# frozen_string_literal: true

FactoryBot.define do
  factory :type_incident, class: 'Incident::TypeIncident' do
    name { 'TypeIncident' }
  end
end
