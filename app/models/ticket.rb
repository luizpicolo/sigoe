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
