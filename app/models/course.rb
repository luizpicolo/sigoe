class Course < ApplicationRecord
  validates :name, presence: true
  has_many :students

  def self.names
    all.collect {|p| [ p.name, p.id ] }
  end
end
