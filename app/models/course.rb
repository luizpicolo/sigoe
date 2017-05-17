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

  validates :name, :initial, presence: true, uniqueness: true
  has_many :students


  search_scope :search do
    attributes :name
  end

  def self.names
    all.collect {|p| [ p.name, p.id ] }
  end

  def self.ordenation_attributes
    [["ID",'id'],["Nome",'name'],["Sigla",'initial']]
  end
end
