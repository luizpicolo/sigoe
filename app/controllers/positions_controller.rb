class PositionsController < ApplicationController
  load_and_authorize_resource

  before_action :set_position, only: [:edit, :destroy, :update]
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Cargos/Função"

    @positions = Position.order("#{set_order}": :asc)
                         .search(params[:search])
                         .page(params[:page]).per(set_amount_return)
  end

  def new
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Cargos/Função", :positions_path
    add_breadcrumb "Novo cargo/função"

    @position = Position.new
  end

  def create
    @positions = Position.new(position_params)
    if @positions.save
      redirect_to positions_path, flash: { success: 'Cargo cadastro com sucesso' }
    else
      flash.now[:error] = @positions.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb "DIREN", sector_actions_path('diren')
    add_breadcrumb "Cargos/Função", :positions_path
    add_breadcrumb "Atualizar cargo/função"
  end

  def update
    if @positions.update(position_params)
      redirect_to positions_path, flash: { success: 'Cargo atualizado com sucesso' }
    else
      flash.now[:error] = @positions.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @positions.destroy
      flash[:success] = "Cargo deletado com sucesso"
      redirect_back(fallback_location: positions_path)
    else
      flash.now[:error] = @positions.errors.full_messages
      render :new
    end
  end

  private

  def set_position
    @positions = Position.find(params[:id])
  end

  def set_order
    params[:order] == "" || params[:order].nil? ? 'id' : params[:order]
  end

  def set_amount_return
    params[:return] == "" || params[:return].nil? ? '15' : params[:return]
  end

  def position_params
    params.require(:position).permit(:name, :initial)
  end
end
