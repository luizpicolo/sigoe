# == Schema Information
#
# Table name: keypasses
#
#  id            :integer          not null, primary key
#  title         :string
#  key           :string
#  local_service :string
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user          :string
#  local         :integer
#

class Keypass < ApplicationRecord
  include SearchCop

  validates :title, presence: true, uniqueness: true
  validates :user, presence: true

  enum local: [:ifms, :ufms, :cemid]

  search_scope :search do
    attributes :title
  end
end
