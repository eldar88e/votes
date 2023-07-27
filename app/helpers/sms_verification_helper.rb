# frozen_string_literal: true
module SmsVerificationHelper
  def send_confirmation_code(resource)
    phone  = resource.phone.scan(/\d/).join('')
    twilio = Twilio::SmsService.new('+' + phone)
    twilio.call
    SmsVerification.create(phone: phone,
                           user_id: resource.id,
                           status: twilio.status,
                           code: twilio.code)
  end
end
