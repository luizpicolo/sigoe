class Sector < ApplicationRecord
  extend FriendlyId
  friendly_id :initial, use: :slugged

  validates :name, :initial, presence: true, uniqueness: true
  has_many :users

  def self.initials
    all.collect {|p| [ p.initial, p.id ] }
  end
end
