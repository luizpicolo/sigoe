class ReportIncidentsController < ApplicationController
  load_and_authorize_resource Incident
  add_breadcrumb "Home", :root_path

  skip_before_action :verify_authenticity_token  

  def new
    add_breadcrumb "Diren", sector_actions_path('diren')
    add_breadcrumb "Ocorrências", :incidents_path
    add_breadcrumb "Relatório ocorrências"
  end

  def create
    incidents = Incident.search(set_conditional).search(set_date_range).order(date_incident: :desc)
    if incidents.present?
      @incidents = incidents
      render layout: false
    else
      flash[:error] = "Não foi encontrada ocorrência para este parâmetros"
      redirect_back(fallback_location: incidents_path)
    end
  end

  private

  def set_conditional
    conditionals = {}
    conditionals[:student] = params[:student] if params[:student].present?
    conditionals[:course] = params[:course] if params[:course].present?
    conditionals[:type_student] = params[:type_student] if params[:type_student].present?
    conditionals[:institution] = params[:institution] if params[:institution].present?
    conditionals
  end

  def set_date_range
    if params[:date_start].present? && params[:date_final].present?
      "date_incident >= #{params[:date_start]} AND date_incident <= #{params[:date_final]}"
    end
  end
end
