class PatientsController < ApplicationController
  include ParamsSearch

  load_and_authorize_resource

  # before_action :set_incident, only: [
  #   :edit, :destroy, :update, :confirmation, :sign, :show
  # ]

  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Enfermaria", sector_actions_path('enfermaria')
    add_breadcrumb "Pacientes"

    @patients = Patient.order("#{set_order}": :desc)
                       .search(params[:search])
                       .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb "Enfermaria", sector_actions_path('enfermaria')
    add_breadcrumb "Pacientes", :patients_path
    add_breadcrumb "Novo paciente"

    @patient = Patient.new
    @patient.habits.build
  end
end
