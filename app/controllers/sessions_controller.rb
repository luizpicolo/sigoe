class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    if sign_in(resource_name, resource)
      redirect_to root_path
    end
  end
end
