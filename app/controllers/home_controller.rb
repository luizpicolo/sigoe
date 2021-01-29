# frozen_string_literal: true

class HomeController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    @email_adm = User.where(admin: true).where.not(email: 'luiz.picolo@ifms.edu.br').first
  end
end
