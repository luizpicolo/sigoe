# Módulo para funções diversas, sem associação com uma entidade em específico
#
module ApplicationHelper
  # Mostra mensagem flash de erro caso a entidade não seja criada
  #
  # @param entity [Object] entidade
  # @param params [Array<String>] contendo os parâmetros carregados via Get
  # @return mensagem flash de erro
  def show_search_error_message(entity, params)
    flash.now[:error] = "Sua busca por <b>#{params[:search]}</b> não obteve resutados" unless entity.present?
  end

  # Retorna os atributos de ordenação para a tag select
  #
  # @example
  #   @users = User.all
  #   attr_order(@users) #=> [["ID",'id'], ["Nome",'name']]
  #
  # @param relation [Activerecord::relation] relacionamento carregado do BD
  # @return [Array<String>] contendo os atributos para a ordenação
  def attr_order(relation)
    entity = convert_to_entity(relation)
    entity.ordenation_attributes
  end

  # Converte uma string em Objeto
  #
  # @example convert_to_entity("User") #=> User
  #
  # @param relation [Activerecord::relation] relacionamento carregado do BD
  # @return [Object] definido mediante a String
  def convert_to_entity(relation)
    eval(relation.class.to_s.split('::').first)
  end

  def  options_for_search(params)
    options_for_select(["15", "30", "45", "50", "75", "100"], params[:return])
  end

  # Converte datas em formato brasileiro
  #
  # @example extract_and_format_date(Time.zone.now) #=> 10/10/2010
  #
  # @param Time
  # @return [String] definido mediante o Time
  def extract_and_format_date(date = nil)
    d = date.present? ? date : Time.zone.now
    d.strftime('%d/%m/%Y')
  end

  # Converte horas em formato brasileiro
  #
  # @example extract_and_format_date(Time.zone.now) #=> 10:10
  #
  # @param Time
  # @return [String] definido mediante o Time
  def extract_and_format_time(time = nil)
    t = time.present? ? time : Time.zone.now
    t.strftime('%H:%M')
  end

  def verificated?(val)
    val == 1 || val == true ? '<i class="fa fa-check"></i>' : '<i class="fa fa-times"></i>'
  end

  # Converte e traduz um conjunto de atributos em um hash
  #
  # @example human_enum_name('model', array_attrs) #=> {'value_traduzido' => 'sem_tradução'}
  #
  # @param String, Array
  # @return [Hasg]
  def human_enum_name(model, attrs)
    hash = {}
    attrs.each do |attr|
      key = I18n.t("activerecord.attributes.#{model}.#{attr}")
      hash[key] = attr
    end
    hash
  end

  def models
    ApplicationRecord.descendants.map(&:name)
  end
end
