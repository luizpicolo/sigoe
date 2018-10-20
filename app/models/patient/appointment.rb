# == Schema Information
#
# Table name: patient_appointments
#
#  id                            :bigint(8)        not null, primary key
#  patient_id                    :bigint(8)
#  companion                     :string
#  medical_referral              :integer
#  nursing_conduct               :integer
#  previous_medical_consultation :text
#  complaints                    :integer
#  description_complaint         :text
#  weight                        :string
#  height                        :string
#  abdominal_perimeter           :string
#  bloodvpressure                :string
#  temperature                   :string
#  heart_rate                    :string
#  respiratory_frequency         :string
#  blood_glucose                 :string
#  tanners_stage                 :integer
#  diagnosis                     :text
#  prescription                  :text
#  evolution                     :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class Patient::Appointment < ApplicationRecord
  include SearchCop

  # validates :patient, presence: true

  belongs_to :patient

  enum complaints: [
    'Exame Preventivo', 'Febre', 'Picada Insetos', 'Geniturinária', 'Orientação',
    'Ocular/Auricular', 'Cólica Mestrual', 'Lesão', 'Gastrintestinal',
    'Tontura/Mal Estar', 'Cefaléia'
  ]
  enum medical_referral: ['Hospital', 'ESF', 'Família', 'Psicóloga']
  enum nursing_conduct: ['Orientações', 'Observação', 'Encaminhamentos']
  enum tanners_stage: [
    'Estágio I', 'Estágio II', 'Estágio III', 'Estágio IV', 'Estágio V'
  ]

  # Atributos para busca com SearchCop
  search_scope :search do
    attributes :complaints
    attributes :created_at
  end

  # Retorna um vetor com os atributos que serão utilizados para a
  # busca nas listagens dos pacientes
  #
  # @return [Array] contendo os atributos para a busca
  def self.ordenation_attributes
    [["ID",'id'], ["Quiexas",'complaints'], ["Data",'created_at']]
  end
end
