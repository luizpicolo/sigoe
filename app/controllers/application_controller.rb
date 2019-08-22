# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_back(fallback_location: root_path)
  end
end
