# frozen_string_literal: true

module ParamsSearch
  extend ActiveSupport::Concern

  def set_order
    params[:order].presence || 'id'
  end

  def set_polo
    current_user.super_admin? ? '' : { polo: current_user.polo_id }
  end

  def set_amount_return
    params[:return].presence || '15'
  end
end