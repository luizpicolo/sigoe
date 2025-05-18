# frozen_string_literal: true

require 'json'

class SessionsController < Devise::SessionsController
  layout false

  def new
    @version = version
    super
  end

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

  private

  def version
    JSON.parse(File.read("#{Rails.root.join('package.json')}"))
  end
end
