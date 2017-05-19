require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#show_search_error_message" do
    it "returns error message if entity not exist" do
      params[:search] = "message"
      expect(helper.show_search_error_message(nil, params)).to eql("Sua busca por <b>#{params[:search]}</b> não obteve resutados")
    end
  end

  describe "#convert_to_entity" do
    it "convert Activerecord::relation to object" do
      expect(helper.convert_to_entity(User.all)).to eql(User)
    end
  end

  describe "#attr_order" do
    it "return ordenation attributes" do
      expect(helper.attr_order(User.all)).to eql(User.ordenation_attributes)
    end
  end
end
