class Incident < ApplicationRecord
  include SearchCop

  validates :user, :assistant, :description, :date_incident, :time_incident, :type_incident,
            presence: true
  validates :visibility, presence: true, inclusion: { in: %w[public private] }

  # Delegates
  delegate :ra, to: :user, prefix: true
  delegate :name, to: :course, prefix: true

  enum is_resolved: { 'no_' => 0, 'yes_' => 1 }
  enum type_student: { 'non_resident' => 0, 'resident' => 1 }
  enum sanction: { 'verbal_warning' => 0, 'written_warning' => 1, 'suspension' => 2,
                   'quitting_school' => 3 }

  belongs_to :student, optional: true
  belongs_to :user
  belongs_to :course, optional: true
  belongs_to :assistant, class_name: 'User'
  belongs_to :type_incident
  has_and_belongs_to_many :prohibition_and_responsibilities
  has_and_belongs_to_many :student_duties

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes incident: 'id'
    attributes student: 'student.id'
    attributes course: 'course.id'
    attributes course_name: 'course.name'
    attributes student_name: 'student.name'
    attributes type_student: 'type_student'
    attributes type_incident: 'type_incident.name'
    attributes type_incident_id: 'type_incident.id'
    attributes date_incident: 'date_incident'
  end

  def student_name
    student.present? ? student.name : ' ---- '
  end

  def signed_by_student_in
    signed_in.strftime('%d/%m/%Y') if signed_in.present?
  end

  ## Charts
  def self.by_years(params_return)
    joins(:course).where(params_return).group_by_year(:created_at, format: '%Y').count
  end

  def self.by_courses(params_return)
    joins(:course).where(params_return).group(:'courses.name').count
  end

  def self.by_is_resolved
    result = group(:is_resolved).count
    result['Não'] = result.delete 'no_'
    result['Sim'] = result.delete 'yes_'
    result['Sem Categoria'] = result.delete nil
    result
  end

  def self.by_type_incident(params_return)
    joins(:course).where(params_return).joins(:type_incident).group(:'type_incidents.name').count
  end

  def self.by_sanction(params_return)
    result = joins(:course).where(params_return).group(:sanction).count
    result['Suspensão'] = result.delete 'suspension'
    result['Adv Escrita'] = result.delete 'written_warning'
    result['Adv Verbal'] = result.delete 'verbal_warning'
    result['Desligamento'] = result.delete 'quitting_school'
    result['Sem Categoria'] = result.delete nil
    result
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens de ocorrencias
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [%w[ID id], %w[Estudante student_id], %w[Data date_incident], %w[Turma course_id]]
  end
end
