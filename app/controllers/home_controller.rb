# frozen_string_literal: true

class HomeController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    @email_adm = User.find_by_admin(true)
  end
end
