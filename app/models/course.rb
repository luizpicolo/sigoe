# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  initial    :string
#

class Course < ApplicationRecord
  include SearchCop

  validates :name, presence: true
  has_many :students

  def self.names
    all.collect {|p| [ p.name, p.id ] }
  end

  search_scope :search do
    attributes :names
  end
end
