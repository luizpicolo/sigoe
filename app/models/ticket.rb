# == Schema Information
#
# Table name: tickets
#
#  id          :integer          not null, primary key
#  from        :string
#  to          :string
#  subject     :string
#  priority    :integer          default("0")
#  description :text
#  status      :integer          default("0")
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  local       :integer
#  answer      :integer
#

class Ticket < ApplicationRecord
  include SearchCop

  # validates :from, :to, :subject, :description,
  #           :priority, :local, presence: true

  enum priority: [:low, :medium, :high]
  enum status: [:open, :close, :remove, :wait]
  enum local: [:ifms, :ufms, :cemid]

  belongs_to :user
  has_many :answers, class_name: "Ticket", :foreign_key => "answer"

  search_scope :search do
    attributes :from, :to, :subject, :description, :status
  end

  def by_sector
    user.sector.initial
  end
end
