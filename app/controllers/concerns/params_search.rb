# frozen_string_literal: true

module ParamsSearch
  extend ActiveSupport::Concern

  def set_order
    params[:order] == '' || params[:order].nil? ? 'id' : params[:order]
  end

  def set_polo
    current_user.super_admin == true ? '' : { polo: current_user.polo_id }
  end

  def set_amount_return
    params[:return] == '' || params[:return].nil? ? '15' : params[:return]
  end
end
