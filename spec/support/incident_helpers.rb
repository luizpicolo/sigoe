# frozen_string_literal: true

module IncidentHelpers
  def create_new_incident(options = {})
    select options[:student], from: 'Estudante'
    select options[:user], from: 'Assistente'
    select 'Residente', from: 'Estudante é?'
    select 'Ifms', from: 'Instituição'
    select options[:type_incident], from: 'Tipos da Ocorrência'
    select 'Não', from: 'Ocorrências resolvida?'
    fill_in 'Data ocorrência', with: Time.zone.now
    fill_in 'Hora ocorrência', with: Time.zone.now
    fill_in 'Ocorrência', with: Faker::Lorem.characters(number: 4)

    click_button 'Salvar'
  end
end

RSpec.configure do |config|
  config.include IncidentHelpers, type: :feature
end
