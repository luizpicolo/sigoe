# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InsidentMailer, type: :mailer do
  describe '#send_mailer' do
    let(:coordenation) { 'admin@admin.com' }
    let(:mail) { InsidentMailer.send_mailer(coordenation) }

    it 'Renders the headers' do
      expect(mail.subject).to eq('Nova ocorrência cadastrada')
      expect(mail.to).to eq([coordenation])
      expect(mail.from).to eq(['sistemas.na@ifms.edu.br'])
    end
  end
end
