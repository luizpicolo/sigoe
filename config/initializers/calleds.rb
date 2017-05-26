Rails.env.on(:any) do
  config.active_record.time_zone_aware_types = [:datetime]
end
