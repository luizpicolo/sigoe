# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_back(fallback_location: root_path)
  end

  def authenticate_admin!
    redirect_to new_user_session_path unless current_user.super_admin?
  end   
end
