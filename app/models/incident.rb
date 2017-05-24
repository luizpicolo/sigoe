class Incident < ApplicationRecord
  validates :student, :user, :local, :description, :date_incident, presence: true

  enum local: [:ifms, :ufms]

  belongs_to :student
  belongs_to :user
end
