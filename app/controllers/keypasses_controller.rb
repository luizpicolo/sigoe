class KeypassesController < ApplicationController
  load_and_authorize_resource

  before_action :set_keypass, only: [:edit, :destroy, :update]
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "SERTI", sector_actions_path('serti')
    add_breadcrumb "Senhas"

    @keypasses = Keypass.search(params[:search]).order('id asc').page(params[:page])
  end

  def new
    add_breadcrumb "SERTI", sector_actions_path('serti')
    add_breadcrumb "Senhas", :users_path
    add_breadcrumb "Nova Senha"

    @keypass = Keypass.new
  end

  def create
    @keypass = Keypass.new(keypass_params)
    if @keypass.save
      redirect_to keypasses_path, flash: { success: 'Senha cadastra com sucesso' }
    else
      flash.now[:error] = @keypass.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb "SERTI", sector_actions_path('serti')
    add_breadcrumb "Senhas", :keypasses_path
    add_breadcrumb "Editar Senha"
  end

  def update
    if @keypass.update(keypass_params)
      redirect_to keypasses_path, flash: { success: 'Senha atualizada com sucesso' }
    else
      flash.now[:error] = @keypass.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @keypass.destroy
      flash[:success] = "Senha deletada com sucesso"
      redirect_back(fallback_location: keypasses_path)
    else
      flash.now[:error] = @keypass.errors.full_messages
      render :new
    end
  end

  private

  def set_keypass
    @keypasses = Keypass.find(params[:id])
  end

  def keypass_params
    params.require(:keypass).permit(
      :title, :key, :local_service, :description, :user, :local
    )
  end
end
