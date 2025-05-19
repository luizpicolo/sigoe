# frozen_string_literal: true

class UsersController < ApplicationController
  include ParamsSearch

  load_and_authorize_resource
  skip_authorize_resource only: %i[change_password update]

  before_action :set_user, only: %i[edit destroy update]
  add_breadcrumb 'Home', :root_path

  def index
    add_breadcrumb 'Administrador'
    add_breadcrumb 'Usuários'

    @users = User.where(set_polo)
        .order("#{set_order}": :desc)
        .search(params[:search])
        .page(params[:page])
  end

  def new
    add_breadcrumb 'Administrador'
    add_breadcrumb 'Usuários', :users_path
    add_breadcrumb 'Novo usuário'

    @user = User.new
    @params_return = set_polo
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, flash: { success: 'Usuário cadastrado com sucesso' }
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    add_breadcrumb 'Administrador'
    add_breadcrumb 'Usuários', :users_path
    add_breadcrumb 'Atualizar usuário'
  end

  def update
    if @user.update(check_password(user_params))
      redirect_to users_path, flash: { success: 'Usuário atualizado com sucesso' }
    else
      flash.now[:error] = @user.errors.full_messages
      render commit_action(params[:commit])
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'Usuário deletado com sucesso'
      redirect_back(fallback_location: users_path)
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def change_password
    add_breadcrumb 'Minhas Informações'
    add_breadcrumb 'Trocar Senha'

    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_password(user_params)
    if user_params[:password].empty?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end
    user_params
  end

  def commit_action(commit)
    return :change_password if commit == 'Trocar senha'

    :edit if commit == 'Salvar'
  end

  def user_params
    params.require(:user).permit(
      :name, :siape, :username, :email, :password,
      :password_confirmation, :status, :avatar, :course_id, :admin, :polo_id
    )
  end
end
