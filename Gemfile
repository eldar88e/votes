source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"
gem "rails", "~> 7.0.6"
gem "puma", "~> 5.0"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "turbo-rails"
gem "stimulus-rails"
gem "bootsnap", require: false
gem "devise", "~> 4.9"
gem "twilio-ruby"
gem 'pg', '~> 1.5'
gem 'sidekiq'
gem 'dotenv-rails'

gem "sprockets-rails"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "jbuilder"

group :development, :test do
  gem "pry"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
