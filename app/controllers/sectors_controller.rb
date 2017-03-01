class SectorsController < ApplicationController
  add_breadcrumb "Home", :root_path

  def actions
    add_breadcrumb "#{params[:sector_id].upcase}"
    render params[:sector_id]
  end
end
