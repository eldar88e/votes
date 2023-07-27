#Twilio::SmsService.new('+905058059917').call
#Twilio::SmsService.new(user.phone_number).call

module Twilio
  class SmsService
    TWILIO_ACCOUNT_SID = 'ACea047588c9dc0ca2a7f4c573b6d0199d' #ENV['TWILIO_ACCOUNT_SID']
    TWILIO_AUTH_TOKEN  = '29a25b1484539319d539ef34076916de'   #ENV['TWILIO_AUTH_TOKEN']
    TWILIO_FROM_PHONE  = '+12179200318'
    TWILIO_TEST_PHONE  = '+905058059917'
    def initialize(to_phone_number)
      @code            = rand(100000..999999)
      @to_phone_number = to_phone_number.to_s
      @status          = nil
    end

    attr_reader :code, :status

    def call
      @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
      twilio = @client.messages.create(from: TWILIO_FROM_PHONE,
                                       to: to(@to_phone_number),
                                       body: "Your verification code is: #{@code}")
      @status = twilio.status
      nil
    end

    private

    def to(to_phone_number)
      return TWILIO_TEST_PHONE if Rails.env.development?

      to_phone_number
    end
  end
end
