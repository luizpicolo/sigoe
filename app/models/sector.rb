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

  # Validações
  validates :name, :initial, presence: true

  # Associações
  has_many :users

  # Retorna um vetor contendo as iniciais e seus respectivos IDs
  #
  # @return [Array] contendo as inicias e seus IDs
  def self.initials
    all.collect {|p| [ p.initial, p.id ] }
  end
end
