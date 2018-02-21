class PatientsController < ApplicationController
  include ParamsSearch

  load_and_authorize_resource

  before_action :set_patient, only: [:edit, :destroy, :update, :show]

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
    @patient.morbids.build
    @patient.physiologicals.build
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, flash: { success: 'Paciente cadastro com sucesso' }
    else
      flash.now[:error] = @patient.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb "Enfermaria", sector_actions_path('enfermaria')
    add_breadcrumb "Pacientes", :users_path
    add_breadcrumb "Atualizar paciente"
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, flash: { success: 'Paciente atualizado com sucesso' }
    else
      flash.now[:error] = @student.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @patient.destroy
      flash[:success] = "Paciente deletado com sucesso"
      redirect_back(fallback_location: patients_path)
    else
      flash.now[:error] = @student.errors.full_messages
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
      :other_information], :morbids_attributes => [:pre_existing_diseases_vascular_accident, :pre_existing_diseases_cancer, :pre_existing_diseases_hypertension, :pre_existing_diseases_cardiopathy, :pre_existing_diseases_diabetes, :pre_existing_diseases_renal, :pre_existing_diseases_pneumopathy, :others_pre_existing_diseases, :allergies_drugs, :allergies_foods, :allergies_cosmetics, :allergies_plaster, :allergies_wool, :others_allergies, :risk_factors_smoking, :risk_factors_ethicism, :risk_factors_chemotherapy, :risk_factors_radiotherapy, :risk_factors_chemical_dependency, :risk_factors_violence, :others_risk_factors], :physiologicals_attributes => [:other_diseases, :continuing_medication, :previous_surgeries, :hospitalization, :first_menstruation, :complaints, :gestation, :children, :abortion]
    )
  end
end
