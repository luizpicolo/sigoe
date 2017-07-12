class ReportIncidentsController < ApplicationController
  load_and_authorize_resource Incident
  add_breadcrumb "Home", :root_path

  def new
    add_breadcrumb "Diren", sector_actions_path('diren')
    add_breadcrumb "Ocorrências", :incidents_path
    add_breadcrumb "Relatório ocorrências"
  end

  def create
    if params[:date_start].present? && params[:date_final].present?
      @incidents = Incident.where(date_incident: params[:date_start]..params[:date_final])
    else
      @incidents = Incident.all
    end
    render layout: false
  end
end
