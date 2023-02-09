# frozen_string_literal: true

# == Schema Information
#
# Table name: polos
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  institution_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  inicial        :string
#

require 'rails_helper'

RSpec.describe Polo, type: :model do
  describe "#initials" do
    let(:user) { FactoryBot.create(:user) }
  
    context "when the user is a super admin" do
      before do
        user.super_admin = true
        user.save
      end
  
      it "returns all the records ordered by name" do
        record1 = FactoryBot.create(:polo, name: "A Name")
        record2 = FactoryBot.create(:polo, name: "B Name")
  
        expect(described_class.initials(user)).to eq([[record1.name, record1.id], [record2.name, record2.id], [user.polo.name, user.polo.id]])
      end
    end
  
    context "when the user is not a super admin" do
      it "returns only the record associated with the user's polo" do
        polo = FactoryBot.create(:polo)
        record = FactoryBot.create(:polo, name: "A Name")
        user.polo = polo
        user.save
  
        expect(described_class.initials(user)).to eq([[user.polo.name, user.polo.id]])
        expect(described_class.initials(user)).not_to eq([[record.name, record.id]])
      end
    end
  end
  
end
