class Keypass < ApplicationRecord
  include SearchCop

  validates :title, presence: true, uniqueness: true
  validates :user, presence: true

  enum local: [:ifms, :ufms, :cemid]

  search_scope :search do
    attributes :title
  end
end
