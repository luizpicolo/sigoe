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

class Sector < ApplicationRecord
  extend FriendlyId
  friendly_id :initial, use: :slugged

  validates :name, :initial, presence: true, uniqueness: true
  has_many :users

  def self.initials
    all.collect {|p| [ p.initial, p.id ] }
  end
end
