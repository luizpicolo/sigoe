# frozen_string_literal: true

class IncidentsController < ApplicationController
  include ParamsSearch

  load_and_authorize_resource

  before_action :set_incident, only: %i[
      edit destroy update confirmation sign show
  ]

  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb 'Diren', sector_actions_path('diren')
    add_breadcrumb 'Ocorrências'

    @incidents = Incident.order("#{set_order}": :desc)
        .search(params[:search])
        .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb 'Diren', sector_actions_path('diren')
    add_breadcrumb 'Ocorrências', :incidents_path
    add_breadcrumb 'Nova ocorrências'

    @incidents = Incident.new
  end

  def create
    @incident = Incident.new(incident_params)
    @incident.user = current_user
    @incident.course = course_by_student(incident_params[:student_id])
    if @incident.save
      send_email_to(@incident&.course&.coordinator&.email)
      redirect_to incidents_path, flash: { success: 'Ocorrência cadastra com sucesso' }
    else
      flash.now[:error] = @incident.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb 'Diren', sector_actions_path('diren')
    add_breadcrumb 'Ocorrências', :incidents_path
    add_breadcrumb 'Atualizar Ocorrência'
  end

  def update
    if @incident.update(incident_params)
      redirect_to incidents_path, flash: { success: 'Ocorrência atualizada com sucesso' }
    else
      flash.now[:error] = @incident.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @incident.destroy
      flash[:success] = 'Ocorrência deletada com sucesso'
      redirect_back(fallback_location: incidents_path)
    else
      flash.now[:error] = @incident.errors.full_messages
      render :new
    end
  end

  def show
    add_breadcrumb 'Diren', sector_actions_path('diren')
    add_breadcrumb 'Ocorrências', :incidents_path
    add_breadcrumb 'visualizar ocorrência'
  end

  ## Mostra a confirmação para que o estudante possa assinar
  def confirmation
    if @incident.student.ra.nil?
      flash.now[:error] = 'Por favor, cadastre uma senha e um R.A para o estudante'
      redirect_to incidents_path
    end
  end

  # Por meio de um usuário RA e senha
  # o estudante assina a ocorrência dando ciencia do fato
  def sign
    if @incident.student.authenticate(params[:incident]['password'])
      if @incident.update(signed_in: Time.zone.now)
        redirect_to incidents_path, flash: { success: 'Ocorrência assinada com sucesso' }
      end
    else
      flash.now[:error] = 'Sua senha esta incorreta'
      render :confirmation
    end
  end

  private

  def course_by_student(student_id)
    Student.find(student_id).course
  end

  def send_email_to(coordinator)
    InsidentMailer.send_mailer(coordinator).deliver_now unless Rails.env.test?
  end

  def set_incident
    @incident = if params[:id]
                  Incident.find(params[:id])
                else
                  Incident.find(params[:incident_id])
                end
  end

  def incident_params
    params.require(:incident).permit(
      :type_incident_id, :student_id, :course_id, :date_incident, :assistant_id, :time_incident, :institution, :description, :soluction,:is_resolved, :type_student, :sanction, prohibition_and_responsibility_ids: [], student_duty_ids: []
    )
  end
end
