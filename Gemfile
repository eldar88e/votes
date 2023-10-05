source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.8"
gem "puma"
gem "redis"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "turbo-rails"
gem "stimulus-rails"
gem "bootsnap", require: false
gem "devise"
gem 'twilio-ruby'
gem 'pg', '~> 1.5'
gem 'sidekiq'
gem 'dotenv-rails'

gem "sprockets-rails"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "jbuilder"

group :development, :test do
  gem "pry"
  gem 'faker'
  gem 'brakeman' # report vulnerabilities
end

group :development do
  gem "web-console"
  gem 'listen'            # Monitoring changes in files and directories in real-time
  gem 'better_errors'     # Shows better errors description on errors page
  gem 'binding_of_caller'
  gem 'chusaku', require: false  # annotations for routes
  gem 'letter_opener'
  gem 'rails-erd'
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem 'annotate'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end
