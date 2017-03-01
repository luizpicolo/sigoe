class Student < ApplicationRecord
  mount_uploader :photo, StudentUploader
  include SearchCop

  delegate :name, to: :course, prefix: true
  delegate :initial, to: :course, prefix: true

  validates :name, :course, presence: true
  belongs_to :course

  search_scope :search do
    attributes :name
    attributes :course => "course.name"
  end
end
