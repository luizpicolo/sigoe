# frozen_string_literal: true

Rails.env.on(:any) do
  config.active_record.time_zone_aware_types = [:datetime]
end
