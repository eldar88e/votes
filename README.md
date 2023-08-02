# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.2.1, RoR 7.0.6

* System dependencies

* Configuration
* Twilio
* Sidekiq
* Database creation PG

create in main catalog the project .env.development file and write

Example:

DB_HOST=localhost

DB_USER=bla-bla

DB_PASSWORD=123456

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

rails db:create

rails db:migrate

rails db:seed

run project:  bin/dev

run sidekiq: bundle exec sidekiq -q default
