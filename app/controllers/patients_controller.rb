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

  def create
    #binding.pry
    @patient = Patient.new(patient_params)
    @patient.habits.new(patient_params['habit_attributes'])
    if @patient.save
      redirect_to patients_path, flash: { success: 'Paciente cadastro com sucesso' }
    else
      flash.now[:error] = @patient.errors.full_messages
      render :new
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(
      :student_id, :habits_attributes => [:sleep_rest, :amount_sleep_hours, :physical_activity,
      :amount_physical_activity, :amount_fruit_vegetable, :amount_red_meat,
      :amount_white_meat, :amount_juice,  :amount_water, :amount_tea,
      :other_information]
    )
  end
end
