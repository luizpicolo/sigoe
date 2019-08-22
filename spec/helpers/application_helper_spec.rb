# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '.show_search_error_message' do
    it 'returns error message if entity not exist' do
      params[:search] = 'message'
      expect(helper.show_search_error_message(nil, params)).to eql("Sua busca por <b>#{params[:search]}</b> não obteve resutados")
    end
  end

  describe '.convert_to_entity' do
    it 'convert Activerecord::relation to object' do
      expect(helper.convert_to_entity(User.all)).to eql(User)
    end
  end

  describe '.attr_order' do
    it 'return ordenation attributes' do
      expect(helper.attr_order(User.all)).to eql(User.ordenation_attributes)
    end
  end

  describe '.extract_and_format_date' do
    it 'return pt-br formated date with params' do
      expect(helper.extract_and_format_date(Time.zone.now)).to eql(Time.zone.now.strftime('%d/%m/%Y'))
    end

    it 'return pt-br formated date within params' do
      expect(helper.extract_and_format_date).to eql(Time.now.strftime('%d/%m/%Y'))
    end
  end

  describe '.extract_and_format_time' do
    it 'return formated time with params' do
      expect(helper.extract_and_format_time(Time.zone.now)).to eql(Time.zone.now.strftime('%H:%M'))
    end

    it 'return formated date within params' do
      expect(helper.extract_and_format_time).to eql(Time.now.strftime('%H:%M'))
    end
  end

  describe '.human_enum_name' do
    let(:human_enum_name) do
      helper.human_enum_name('incident.type_student', Incident.type_students.keys)
    end

    it 'return hash' do
      expect(human_enum_name).to be_kind_of(Hash)
    end

    it 'return hash with translated key in pt-br' do
      expect(human_enum_name['Não residente']).to eq('non_resident')
      expect(human_enum_name['Residente']).to eq('resident')
    end
  end
end
