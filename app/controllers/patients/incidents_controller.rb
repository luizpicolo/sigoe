class Patients::IncidentsController < ApplicationController
  include ParamsSearch

  load_and_authorize_resource

  before_action :set_incident, only: [:edit, :destroy, :update, :show]

  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Enfermaria", sector_actions_path('enfermaria')
    add_breadcrumb "Pacientes", :patients_path
    add_breadcrumb "Ocorrências"

    @incidents = Patient::Incident.order("#{set_order}": :desc)
                                  .search(params[:search])
                                  .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb "Enfermaria", sector_actions_path('enfermaria')
    add_breadcrumb "Pacientes", :patients_path
    add_breadcrumb "Ocorrências", :patient_incidents_path
    add_breadcrumb "Nova Ocorrência"

    @incident = Patient::Incident.new
  end

  def create
    @incident = Patient::Incident.new(incidents_params)
    @incident.patient = params[:patient_id]
    if @incident.save
      redirect_to patient_incidents_path, flash: { success: 'Ocorrência cadastra com sucesso' }
    else
      flash.now[:error] = @incident.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb "Enfermaria", sector_actions_path('enfermaria')
    add_breadcrumb "Pacientes", :patients_path
    add_breadcrumb "Ocorrências", :patient_incidents_path
    add_breadcrumb "Atualizar Ocorrência"
  end

  # def update
  #   if @patient.update(patient_params)
  #     redirect_to patients_path, flash: { success: 'Paciente atualizado com sucesso' }
  #   else
  #     flash.now[:error] = @student.errors.full_messages
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   if @patient.destroy
  #     flash[:success] = "Paciente deletado com sucesso"
  #     redirect_back(fallback_location: patients_path)
  #   else
  #     flash.now[:error] = @student.errors.full_messages
  #     render :new
  #   end
  # end
  #
  private

  def set_incident
    @incident = Patient::Incident.find(params[:id])
  end

  def incidents_params
    params.require(:patient_incident).permit(
      :companion, :medical_referral,
      :nursing_conduct, :previous_medical_consultation, :complaints,
      :description_complaint, :weight, :height, :abdominal_perimeter,
      :bloodvpressure , :temperature, :heart_rate, :respiratory_frequency,
      :blood_glucose, :tanners_stage, :diagnosis, :prescription, :evolution
    )
  end
end
