source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.8"
gem 'puma'
gem 'redis'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "turbo-rails"
gem "stimulus-rails"
gem "bootsnap", require: false
gem 'sprockets-rails'
gem 'jsbundling-rails'
gem 'cssbundling-rails'
gem 'jbuilder'
gem 'pg'

gem "devise"
gem 'twilio-ruby'
gem 'sidekiq'
gem 'dotenv-rails'
gem 'activeadmin'
gem 'sassc-rails'
gem 'rails-i18n'
gem 'globalize'
gem 'globalize-accessors'

group :development, :test do
  gem 'faker'
  gem 'pry'
end

group :development do
  gem 'better_errors' # Shows better errors description on errors page
  gem "binding_of_caller" # For better errors: activates webconsole directly in browser
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'webmock'
end
