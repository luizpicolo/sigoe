class Api::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  respond_to :json

  # Adicione este método:
  def create
    user = User.find_for_database_authentication(username: params[:user][:username])
    if user&.valid_password?(params[:user][:password])
      p sign_in(:user, user)
      render json: { user: user, message: 'Login realizado com sucesso' }, status: :ok
    else
      render json: { error: 'Usuário ou senha inválidos' }, status: :unauthorized
    end
  end
end
