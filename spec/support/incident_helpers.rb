# frozen_string_literal: true

module IncidentHelpers
  def create_new_incident(options = {})
    select options[:student], from: 'Estudante'
    select options[:user], from: 'Assistente'
    select 'Residente', from: 'Estudante é?'
    select 'sector', from: 'Encaminhar para'
    select options[:type_incident], from: 'Tipos da Ocorrência'
    select 'Não', from: 'Ocorrências resolvida?'
    fill_in 'Data ocorrência', with: Time.zone.now
    fill_in 'Hora ocorrência', with: Time.zone.now
    fill_in 'Ocorrência', with: Faker::Lorem.characters(number: 4)

    click_button 'Salvar'
  end

  def set_polo(current_user = nil)
    current_user.super_admin == true ? '' : { polo: current_user.polo_id }
  end

  def params_return(current_user)
    if !set_polo(current_user).empty?
      { courses: set_polo(current_user) }
    else
      set_polo(current_user)
    end
  end
end

RSpec.configure do |config|
  config.include IncidentHelpers
end
