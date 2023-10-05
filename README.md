# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.2.2, RoR 7.0.8

* System dependencies

* Configuration

* Database creation PG

Create in project catalog .env-file and write

DB_HOST=localhost

DB_USER=user_your_db

DB_PASSWORD=pass_your_db

TWILIO_ACCOUNT_SID="<your_twilio_account_sid>"

TWILIO_AUTH_TOKEN="<your_twilio_token>"

TWILIO_FROM_PHONE="<phone_for_twilio>"

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

rails db:setup
yarn install
run project:  bin/dev


