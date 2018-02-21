# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Patient < ApplicationRecord
  include SearchCop

  # Validações
  validates :student, :habits, :physiologicals, :morbids, presence: true

  belongs_to :student
  has_many :habits, dependent: :destroy
  has_many :morbids, dependent: :destroy
  has_many :physiologicals, dependent: :destroy

  accepts_nested_attributes_for :habits, allow_destroy: true
  accepts_nested_attributes_for :morbids, allow_destroy: true
  accepts_nested_attributes_for :physiologicals, allow_destroy: true

  delegate :name, to: :student

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :name
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens dos pacientes
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["Nome",'name']]
  end
end
