# frozen_string_literal: true

class SectorsController < ApplicationController
  add_breadcrumb 'Home', :root_path

  def actions
    add_breadcrumb params[:sector_id].upcase.to_s
    render params[:sector_id]
  end
end
