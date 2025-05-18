class Api::UsersController < ApplicationController
  before_action :authenticate_user!

  def validation
    user = get_user_from_token
    render json: {
        message: "If you see this, you're in!",
        user: user
    }
  end

  private

  def get_user_from_token
    token = request.headers['Authorization']&.split(' ')&.last
    return nil unless token

    jwt_payload, = JWT.decode(token, Rails.application.credentials.jwt_secret_key, true,
                              { algorithm: 'HS256' })
    user_id = jwt_payload['sub']
    User.find(user_id.to_s)
  end
end
