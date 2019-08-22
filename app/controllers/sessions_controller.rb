# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    redirect_to root_path if sign_in(resource_name, resource)
  end
end
