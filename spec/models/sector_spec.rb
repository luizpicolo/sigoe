# == Schema Information
#
# Table name: sectors
#
#  id         :integer          not null, primary key
#  name       :string
#  initial    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  icon       :string
#

require 'rails_helper'

RSpec.describe Sector, type: :model do
  before(:each) do
    # SERTI, AUDI, DIREN
    @serti = FactoryGirl.create(:sector,  initial: 'serti')
    @audi = FactoryGirl.create(:sector, initial: 'audi')
    @diren = FactoryGirl.create(:sector, initial: 'diren')
    @prof = FactoryGirl.create(:sector, initial: 'prof')

    @sectors = Sector.initials
  end

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:initial) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:initial) }

  describe "#initials" do
    it "should return an array" do
      expect(@sectors).to be_an_instance_of(Array)

      @sectors.each do |sector|
        expect(sector).to be_an_instance_of(Array)
      end
    end

    ['serti', 'audi', 'diren', 'prof'].each do |sector|
      it "should return sector #{sector}" do
        expect(@sectors).to include(a_string_starting_with(sector))
      end
    end
  end
end
