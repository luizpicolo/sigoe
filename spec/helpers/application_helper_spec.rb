require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe ".show_search_error_message" do
    it "returns error message if entity not exist" do
      params[:search] = "message"
      expect(helper.show_search_error_message(nil, params)).to eql("Sua busca por <b>#{params[:search]}</b> não obteve resutados")
    end
  end

  describe ".convert_to_entity" do
    it "convert Activerecord::relation to object" do
      expect(helper.convert_to_entity(User.all)).to eql(User)
    end
  end

  describe ".attr_order" do
    it "return ordenation attributes" do
      expect(helper.attr_order(User.all)).to eql(User.ordenation_attributes)
    end
  end

  describe ".formated_date" do
    it 'return pt-br formated date with params' do
      expect(helper.formated_date(Time.now)).to eql(Time.now.strftime("%d/%m/%Y"))
    end

    it 'return pt-br formated date within params' do
      expect(helper.formated_date()).to eql(Time.now.strftime("%d/%m/%Y"))
    end
  end
end
