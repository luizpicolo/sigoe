# frozen_string_literal: true

Rails.env.on(:any) do
  # Configuration default for time zone
  config.time_zone = 'Atlantic Time (Canada)'
  config.i18n.default_locale = :'pt-BR'
  config.active_record.default_timezone = :utc
end
