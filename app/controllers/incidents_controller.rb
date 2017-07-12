class IncidentsController < ApplicationController
  load_and_authorize_resource

  before_action :set_incident, only: [:edit, :destroy, :update]
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "Diren", sector_actions_path('diren')
    add_breadcrumb "Ocorrências"

    @incidents = Incident.order("#{set_order}": :asc)
                         .search(params[:search])
                         .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb "Diren", sector_actions_path('diren')
    add_breadcrumb "Ocorrências", :incidents_path
    add_breadcrumb "Nova ocorrências"

    @incidents = Incident.new
  end

  def create
    @incident = Incident.new(incident_params)
    @incident.user = current_user
    if @incident.save
      redirect_to incidents_path, flash: { success: 'Ocorrência cadastra com sucesso' }
    else
      flash.now[:error] = @incident.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb "Diren", sector_actions_path('diren')
    add_breadcrumb "Ocorrências", :incidents_path
    add_breadcrumb "Atualizar Ocorrência"
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
      flash[:success] = "Ocorrência deletada com sucesso"
      redirect_back(fallback_location: incidents_path)
    else
      flash.now[:error] = @incident.errors.full_messages
      render :new
    end
  end

  private

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def set_order
    params[:order] == "" || params[:order].nil? ? 'id' : params[:order]
  end

  def set_amount_return
    params[:return] == "" || params[:return].nil? ? '15' : params[:return]
  end

  def incident_params
    params.require(:incident).permit(
      :student_id, :course_id, :date_incident, :assistant_id, :time_incident, :institution,
      :description, :soluction
    )
  end
end
