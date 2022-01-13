# frozen_string_literal: true

class HomeController < ApplicationController
  include ParamsSearch

  add_breadcrumb 'Home', :root_path

  def index
    @params_return = params_return
  end

  private

  def params_return
    if !set_polo.empty?
      { courses: set_polo }
    else
      set_polo
    end
  end
end
