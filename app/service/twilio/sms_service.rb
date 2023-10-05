#Twilio::SmsService.new('+905051112233').call
#Twilio::SmsService.new(user.phone_number).call

module Twilio
  class SmsService
    def initialize(to_phone_number)
      @code            = rand(1000..9999)
      @to_phone_number = to_phone_number
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
      return TWILIO_TEST_PHONE if TWILIO_TEST_PHONE && Rails.env.development?

      to_phone_number
    end
  end
end
