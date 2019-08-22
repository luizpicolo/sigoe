# frozen_string_literal: true

class InsidentMailer < ApplicationMailer
  def send_mailer(coordenation)
    @contact = coordenation
    mail(
      to: coordenation,
      from: 'sistemas.na@ifms.edu.br',
      subject: 'Nova ocorrência cadastrada'
    )
  end
end
