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
  end

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:initial) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:initial) }

  describe "#initials" do
    it "test" do
      expect(Sector.initials).to eq([@serti])
    end
  end
end
