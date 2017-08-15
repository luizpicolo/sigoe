Rails.env.on(:any) do
  # config mailer
  config.action_mailer.default_url_options = { host: ENV['SMTP_DOMAIN'] }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address =>  ENV['SMTP_ADDRESS'],
    :port => ENV['SMTP_PORT'],
    :domain => ENV['SMTP_DOMAIN'],
    :user_name => ENV['SMTP_USER_NAME'],
    :password => ENV['SMTP_PASSWORD'],
    :authentication => 'plain',
    :enable_starttls_auto => true,
    # :openssl_verify_mode => 'none'
  }
end

Rails.env.on(:development) do
  # Send email in development mode.
  config.action_mailer.perform_deliveries = true
end
