module ApplicationHelper
  def show_search_error_message(entity, params)
    flash.now[:error] = "Sua busca por <b>#{params[:search]}</b> não obteve resutados" unless entity.present?
  end
end
