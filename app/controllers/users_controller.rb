class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :set_user, only: [:edit, :destroy, :update]
  add_breadcrumb "Home", :root_path

  def index
    add_breadcrumb "SERTI", sector_actions_path('serti')
    add_breadcrumb "Usuários"

    @users = User.search(params[:search]).page(params[:page])
  end

  def new
    add_breadcrumb "SERTI", sector_actions_path('serti')
    add_breadcrumb "Usuários", :users_path
    add_breadcrumb "Novo usuário"

    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, flash: { success: 'Usuário cadastro com sucesso' }
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb "SERTI", sector_actions_path('serti')
    add_breadcrumb "Usuários", :users_path
    add_breadcrumb "Atualizar usuário"
  end

  def update
    if @user.update(check_password(user_params))
      redirect_to users_path, flash: { success: 'Usuário atualizado com sucesso' }
    else
      flash.now[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to :back, flash: { success: "Usuário deletado com sucesso" }
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_password(user_params)
    if user_params[:password].empty?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
      user_params
    else
      user_params
    end
  end

  def user_params
    params.require(:user).permit(
      :name, :admin, :siape, :sector_id, :username, :email, :password,
      :password_confirmation, :status
    )
  end
end
