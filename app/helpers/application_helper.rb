module ApplicationHelper
  def show_search_error_message(entity, params)
    flash.now[:error] = "Sua busca por <b>#{params[:search]}</b> não obteve resutados" unless entity.present?
  end

  def attr_order(relation)
    entity = convert_to_entity(relation)
    entity.ordenation_attributes
  end

  def convert_to_entity(relation)
    eval(relation.class.to_s.split('::').first)
  end
end
