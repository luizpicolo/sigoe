class HomeController < ApplicationController
  add_breadcrumb "Home", :root_path

  def index
    @sectors = Sector.order(name: :asc)
  end
end
