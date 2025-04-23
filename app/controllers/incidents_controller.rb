# frozen_string_literal: true

class IncidentsController < ApplicationController
  include ParamsSearch

  load_and_authorize_resource

  before_action :set_incident, only: %i[
      edit destroy update confirmation sign show export_to_academic_system
  ]

  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb 'Ocorrências'
    add_breadcrumb 'Lista de Ocorrências'

    @incidents = Incident.joins(:course)
                         .where(params_return)
                         .order("#{set_order}": :desc)
                         .search(params[:search])
                         .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb 'Ocorrências'
    add_breadcrumb 'Lista de Ocorrências', :incidents_path
    add_breadcrumb 'Nova ocorrências'

    @polo = set_polo
    @params_return = current_user.super_admin? ? '' : params_return.except(:user)
    @incidents = Incident.new
  end

  def create
    @incident = Incident.new(incident_params)
    @incident.user = current_user
    @incident.course = course_by_student(incident_params[:student_id])
    if @incident.save
      unless incident_params[:sector_id].empty?
        # send_email_to(Sector.find(incident_params[:sector_id]).email)
      end
      redirect_to incidents_path, flash: { success: 'Ocorrência cadastra com sucesso' }
    else
      flash.now[:error] = @incident.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb 'Ocorrências'
    add_breadcrumb 'Lista de Ocorrências', :incidents_path
    add_breadcrumb 'Atualizar Ocorrência'

    @polo = set_polo
    @params_return = current_user.super_admin? ? '' : params_return.except(:user)
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
    add_breadcrumb 'Ocorrências'
    add_breadcrumb 'Lista de Ocorrências', :incidents_path
    add_breadcrumb 'visualizar ocorrência'
  end

  def confirmation
    return unless @incident.student.ra.nil?

    flash.now[:error] = 'Por favor, cadastre uma senha e um R.A para o estudante'
    redirect_to incidents_path
  end

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

  def export_to_academic_system
    @incident = set_incident
  end

  private

  def course_by_student(student_id)
    Student.find(student_id).course
  end

  def send_email_to(sector)
    return if Rails.env.test?

    InsidentMailer.send_mailer(sector).deliver_now if sector.present?
  end

  def set_incident
    @incident = Incident.find(params[:id] || params[:incident_id])
  end

  def params_return
    return '' if current_user.super_admin?
    return set_polo if set_polo.empty?

    params = { courses: set_polo }

    if can?(:read_restricted, Incident)
      params[:user] = current_user unless current_user.admin? || current_user.super_admin?
      params[:visibility] = %w[public private]
    else
      params[:visibility] = %w[public]
    end

    params
  end

  def incident_params
    params.require(:incident).permit(
      :type_incident_id, :student_id, :course_id, :date_incident, :sector_id, :assistant_id, :time_incident, :institution, :description, :soluction, :is_resolved, :visibility, :type_student, :sanction, prohibition_and_responsibility_ids: [], student_duty_ids: []
    )
  end
end
