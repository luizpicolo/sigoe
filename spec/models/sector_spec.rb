require 'rails_helper'

RSpec.describe Sector, type: :model do
  # Associations
  it { should belong_to(:polo) }

  describe ".get_all" do
    before do
      # Create some test sectors
      @sector1 = FactoryBot.create(:sector, name: "Sector 1")
      @sector2 = FactoryBot.create(:sector, name: "Sector 2")
      @sector3 = FactoryBot.create(:sector, name: "Sector 3")
    end

    it "returns an array of sector names and ids" do
      result = described_class.get_all({})
      expect(result).to eq([[@sector1.name, @sector1.id], [@sector2.name, @sector2.id], [@sector3.name, @sector3.id]])
    end

    it "orders the sectors by name ascending" do
      result = described_class.get_all({})
      expect(result).to eq([[@sector1.name, @sector1.id], [@sector2.name, @sector2.id], [@sector3.name, @sector3.id]])
      expect(result.map(&:first)).to eq([@sector1.name, @sector2.name, @sector3.name])
    end

    it "filters the sectors based on the provided parameters" do
      result = described_class.get_all(polo_id: @sector1.polo_id)
      expect(result).to eq([[@sector1.name, @sector1.id]])
    end
  end
end
