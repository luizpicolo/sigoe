class User < ApplicationRecord
  include SearchCop

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :rememberable, :trackable,
         :validatable

  belongs_to :sector
  has_many :tickets

  search_scope :search do
    attributes :name, :email, :siape
    attributes :sector => "sector.initial"
  end

  def is_current?(current_user)
    current_user.id == id ? true : false
  end

  def it_is_part_of_the_sector?(s)
    sector.initial.downcase == s ? true : false
  end
end
