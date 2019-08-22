# frozen_string_literal: true

class Patients::AppointmentsController < ApplicationController
  include ParamsSearch

  load_and_authorize_resource class: 'Patient::Appointment', except: [:create]

  before_action :set_appointment, only: %i[edit destroy update show]

  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb 'Enfermaria', sector_actions_path('enfermaria')
    add_breadcrumb 'Pacientes', :patients_path
    add_breadcrumb 'Ocorrências'

    @appointments = Patient::Appointment.order("#{set_order}": :desc)
                                        .search(params[:search])
                                        .where(patient_id: params[:patient_id])
                                        .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb 'Enfermaria', sector_actions_path('enfermaria')
    add_breadcrumb 'Pacientes', :patients_path
    add_breadcrumb 'Ocorrências', :patient_appointments_path
    add_breadcrumb 'Nova Ocorrência'

    @appointment = Patient::Appointment.new
  end

  def create
    @appointment = Patient::Appointment.new(appointments_params)
    @appointment.patient = Patient.find(params[:patient_id])
    if @appointment.save
      redirect_to patient_appointments_path, flash: { success: 'Ocorrência cadastra com sucesso' }
    else
      flash.now[:error] = @appointment.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb 'Enfermaria', sector_actions_path('enfermaria')
    add_breadcrumb 'Pacientes', :patients_path
    add_breadcrumb 'Ocorrências', :patient_appointments_path
    add_breadcrumb 'Atualizar Ocorrência'
  end

  def update
    if @appointment.update(appointments_params)
      redirect_to patient_appointments_path(patient_id: @appointment.patient_id), flash: { success: 'Ocorrência atualizada com sucesso' }
    else
      flash.now[:error] = @appointment.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @appointment.destroy
      flash[:success] = 'Ocorrência deletada com sucesso'
      redirect_back(fallback_location: patient_appointments_path)
    else
      flash.now[:error] = @appointment.errors.full_messages
      render :new
    end
  end

  private

  def set_appointment
    @appointment = Patient::Appointment.find(params[:id])
  end

  def appointments_params
    params.require(:patient_appointment).permit(
      :companion, :medical_referral,
      :nursing_conduct, :previous_medical_consultation, :complaints,
      :description_complaint, :weight, :height, :abdominal_perimeter,
      :bloodvpressure, :temperature, :heart_rate, :respiratory_frequency,
      :blood_glucose, :tanners_stage, :diagnosis, :prescription, :evolution
    )
  end
end
