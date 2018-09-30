class SchoolGroupsController < ApplicationController
  include ParamsSearch

  load_and_authorize_resource

  before_action :set_school_group, only: [:edit, :destroy, :update]
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Turmas"

    @school_groups = SchoolGroup.order("#{set_order}": :desc)
                                .search(params[:search])
                                .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Turmas", :school_groups_path
    add_breadcrumb "Nova Turma"

    @school_group = SchoolGroup.new
  end

  def create
    @school_group = SchoolGroup.new(school_group_params)
    if @school_group.save
      redirect_to school_groups_path, flash: { success: 'Turma cadastra com sucesso' }
    else
      flash.now[:error] = @school_group.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Turmas", :school_groups_path
    add_breadcrumb "Atualizar turma"
  end

  def update
    if @school_group.update(school_group_params)
      redirect_to school_groups_path, flash: { success: 'Turma atualizada com sucesso' }
    else
      flash.now[:error] = @school_group.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @school_group.destroy
      flash[:success] = "Turma deletada com sucesso"
      redirect_back(fallback_location: school_groups_path)
    else
      flash.now[:error] = @school_group.errors.full_messages
      render :index
    end
  end

  private

  def set_school_group
    @school_group = SchoolGroup.find(params[:id])
  end

  def school_group_params
    params.require(:school_group).permit(:name, :identifier)
  end
end
