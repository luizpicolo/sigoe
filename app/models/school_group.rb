# frozen_string_literal: true

# == Schema Information
#
# Table name: school_groups
#
#  id         :integer          not null, primary key
#  name       :string
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  polo_id    :integer
#  old_id     :integer
#

class SchoolGroup < ApplicationRecord
  include SearchCop

  # Validações
  validates :name, :identifier, presence: true
  validates :name, uniqueness: true

  # Associações
  has_many :incidents
  has_many :students
  belongs_to :polo

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :name
  end

  def identification
    identifier.presence || name
  end

  # Retorna um vetor contendo as identificacoes das classes
  #
  # @return [Array] contendo as identificacoes
  def self.identifiers
    order('identifier asc').collect { |p| [p.identifier, p.id] }
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens de funções
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [%w[ID id], %w[Nome name], %w[Identificador identifier]]
  end

  # Retorna um vetor contendo os nomes e seus respectivos IDs
  #
  # @return [Array] contendo nomes e seus IDs
  def self.get_all
    order('name asc').collect { |p| [p.name, p.id] }
  end
end
