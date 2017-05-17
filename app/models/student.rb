# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  course_id  :integer
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

  def self.ordenation_attributes
    [["ID",'id'], ["Nome",'name']]
  end
end
