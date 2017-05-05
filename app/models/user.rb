# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string           default(""), not null
#  name                   :string
#  siape                  :integer
#  sector_id              :integer
#

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
