# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'active_link_to'
gem 'alert_message', '~> 2.0'
gem 'bcrypt', '~> 3.1.15'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'breadcrumbs_on_rails'
gem 'cancancan'
gem 'carrierwave'
gem 'carrierwave-ftp', require: 'carrierwave/storage/sftp'
gem 'chartkick', '>= 3.2.0'
gem 'clipboard-rails'
gem 'coffee-rails'
gem 'devise', '>= 4.7.1'
gem 'devise-i18n'
gem 'erubis'
gem 'figaro'
gem 'font-awesome-sass'
gem 'friendly_id', '~> 5.4.2'
gem 'groupdate'
gem 'htmlcompressor'
gem 'httparty'
gem 'jbuilder', '~> 2.11'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-ui-rails'
gem 'kaminari'
gem 'loofah', '>= 2.2.3'
gem 'mechanize'
gem 'mini_magick', '>= 4.11.0'
gem 'modernizr-rails'
gem 'nokogiri', '>= 1.11.0.rc4'
gem 'newrelic_rpm'
gem 'pdfkit'
gem 'pg'
gem 'puma', '~> 5.2'
gem 'rack', '>= 2.2.2'
gem 'rails', '~> 6.1'
gem 'rails-env'
gem 'rails-i18n'
gem 'randumb'
gem 'rubyzip', '>= 1.3.0'
gem 'sass-rails'
gem 'sassc'
gem 'search_cop'
gem 'seed_migration'
gem 'spreadsheet'
gem 'sprockets', '~> 3.7.2'
gem 'sprockets-rails'
gem 'turbolinks'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier'
gem 'webpacker', '~> 5.2'
gem 'whenever', require: false
gem 'wkhtmltopdf-binary'

group :development, :test do
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '>= 2.15'
  gem 'database_rewinder'
  gem 'email_spec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fuubar'
  gem 'rails-controller-testing'
  gem 'regressor', git: 'https://github.com/ndea/regressor.git'
  gem 'rspec-rails', '~> 5.0.1'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'simplecov', '~> 0.21.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'webdrivers'
end

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'listen', '>= 3.0.5', '< 3.6'
  gem 'pry-byebug'
  gem 'rails-erd'
  gem 'rails_best_practices', '~> 1.20'
  gem 'rb-readline'
  gem 'rename'
  gem 'rubocop', '~> 1.11.0', require: false
  gem 'web-console', '>= 3.3.0'
end

group :staging, :production do
  gem 'mini_racer'
end

group :production do
  gem 'rails_12factor'
  gem 'turnout'
end
