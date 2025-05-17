class Api::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session
  respond_to :json

  before_action :configure_sign_in_params, only: [:create]

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { user: resource, message: 'Login realizado com sucesso' }, status: :ok
    else
      render json: { error: 'Usuário ou senha inválidos' }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    head :no_content
  end
end
