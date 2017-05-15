require "rails_helper"

describe ApplicationHelper do
  describe "#show_search_error_message" do
    it "returns error message if entity not exist" do
      params[:search] = "message"
      expect(helper.show_search_error_message(nil, params)).to eql("Sua busca por <b>#{params[:search]}</b> não obteve resutados")
    end
  end
end
