class SendConfirmationCodeJob < ApplicationJob
  include SmsVerificationHelper

  queue_as :default

  def perform(*args)
    send_confirmation_code(args.first)
  end
end
