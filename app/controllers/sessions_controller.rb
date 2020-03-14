# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    _sign_in = sign_in(resource_name, resource)
    if resource.status && _sign_in
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      redirect_to root_path
    else 
      sign_out_and_redirect(resource_name) 
    end
  end
end
