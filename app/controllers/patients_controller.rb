class PatientsController < ApplicationController
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

  private

  def set_order
    params[:order] == "" || params[:order].nil? ? 'id' : params[:order]
  end

  def set_amount_return
    params[:return] == "" || params[:return].nil? ? '15' : params[:return]
  end
end
