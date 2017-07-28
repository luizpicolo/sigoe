# == Schema Information
#
# Table name: incidents
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  user_id       :integer
#  institution   :integer
#  description   :text
#  date_incident :date
#  soluction     :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  course_id     :integer
#  time_incident :time
#  assistant_id  :integer
#  signed_in     :datetime
#

class Incident < ApplicationRecord
  include SearchCop

  validates :user, :assistant, :institution, :description,
	    :date_incident, :time_incident, presence: true

  enum institution: ['Ifms', 'Ufms', 'Cemid']
  enum is_resolved: ['Não', 'Sim']
  enum type_student: ['Não Residente', 'Residente']
  enum sanction: ['Advertência Verbal', 'Advertência Escrita', 'Suspensão',
                  'Desligamento']

  belongs_to :student, optional: true
  belongs_to :user
  belongs_to :course, optional: true
  belongs_to :assistant, class_name: 'User', foreign_key: 'assistant_id'

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes student: "student.id"
    attributes course: "course.id"
    attributes institution: "institution"
    attributes type_student: "type_student"
    attributes date_incident: "date_incident"
  end

  def student_name
    student.present? ? student.name : " ---- "
  end

  def course_initial
    course.present? ? course.initial : " ---- "
  end

  def signed_by_student_in
    signed_in.strftime('%d/%m/%Y as %H:%M') if signed_in.present?
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens de ocorrencias
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["Estudante",'student_id'], ["Instituição",'institution'],
     ["Data",'date_incident']]
  end
end
