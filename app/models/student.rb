# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id                  :integer          not null, primary key
#  name                :string
#  course_id           :integer
#  photo               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  responsible         :string
#  responsible_contact :string
#  contact             :string
#  ra                  :integer
#  password            :string
#  password_digest     :string
#  enrollment          :string
#  cpf                 :string
#  birth_date          :date
#  course_situation    :integer
#

class Student < ApplicationRecord
  has_secure_password

  mount_uploader :photo, StudentUploader
  include SearchCop

  enum course_situation: [
      'Egresso', 'Falecido', 'Trancado', 'Transferido Externamente',
      'Transferido Internamente', 'Em curso', 'Evadido', 'Desligado',
      'Regime Domiciliar', 'Integralizado em fase escolar',
      'Concluído', 'Enriquecimento Curricular', 'Em mobilidade acadêmica',
      'Reprovado', 'Aluno Especial'
  ]

  delegate :name, to: :course, prefix: true
  delegate :initial, to: :course, prefix: true

  # Validações
  validates :name, :course, :ra, presence: true

  # Associações
  belongs_to :course
  belongs_to :school_group

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :name
    attributes course: 'course.name'
    attributes initial: 'course.initial'
    attributes school_group: 'school_group.name'
  end

  # Retorna um vetor contendo os nomes e seus respectivos IDs
  #
  # @return [Array] contendo nomes e seus IDs
  def self.get_all
    order('name asc').collect { |p| [p.name, p.id] }
  end

  def self.import(attributes, course)
    student = find_by_ra(attributes[2]) || new
    student.assign_attributes(set_attributes(student, course, attributes))
    student.save
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens dos estudantes
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [%w[ID id], %w[Nome name]]
  end

  private

  def self.set_attributes(student, course, attributes)
    params = {
        name: attributes[3],
        course: course,
        contact: attributes[6],
        ra: attributes[2].to_i,
        enrollment: attributes[1],
        cpf: attributes[4],
        birth_date: attributes[5],
        course_situation: attributes[7]
    }
    check_password(student, params)
  end

  def self.check_password(student, params)
    if student.password.nil?
      params['password'] = rand(11_111_111..99_999_999).to_s
      params
    else
      params
    end
  end
end
