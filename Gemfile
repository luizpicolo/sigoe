# frozen_string_literal: true
source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'active_link_to'
gem 'alert_message'
gem 'bcrypt', '~> 3.1.7'
gem 'breadcrumbs_on_rails'
gem 'cancancan'
gem 'carrierwave'
gem 'carrierwave-ftp', require: 'carrierwave/storage/sftp'
gem 'chartkick', '>= 3.2.0'
gem 'clipboard-rails'
gem 'coffee-rails'
gem 'devise'
gem 'devise-i18n'
gem 'erubis'
gem 'figaro'
gem 'font-awesome-sass'
gem 'friendly_id', '~> 5.1.0'
gem 'groupdate'
gem 'htmlcompressor'
gem 'httparty'
gem 'ionicons-rails' ## Será removido no futuro
gem 'jbuilder'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'loofah', '>= 2.2.3'
gem 'mechanize'
gem 'mini_magick'
gem 'modernizr-rails'
gem 'pdfkit'
gem 'pg'
gem 'rack', '>= 2.0.6'
gem 'rails'
gem 'rails-env'
gem 'rails-i18n'
gem 'randumb'
gem 'sass-rails'
gem 'search_cop'
gem 'seed_migration'
gem 'spreadsheet'
gem 'turbolinks'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier'
gem 'whenever', require: false
gem 'wkhtmltopdf-binary'

group :development, :test do
  gem 'binding_of_caller'
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'database_rewinder'
  gem 'email_spec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'regressor', git: 'https://github.com/ndea/regressor.git'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'simplecov'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'listen', '~> 3.0.5'
  gem 'mina', '0.3.8'
  gem 'pry-byebug'
  gem 'puma', '~> 3.0'
  gem 'rails-erd'
  gem 'rails_best_practices', '~> 1.18', '>= 1.18.1'
  gem 'rb-readline'
  gem 'rename'
  gem 'web-console'
  gem 'yard'
end

group :staging, :production do
  gem 'mini_racer'
  gem 'passenger'
end

group :production do
  gem 'rails_12factor'
  gem 'turnout'
end
