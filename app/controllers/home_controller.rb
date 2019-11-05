# frozen_string_literal: true

class HomeController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def index
    @sectors = Sector.order(name: :desc)
  end
end
