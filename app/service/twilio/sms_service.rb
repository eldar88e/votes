#Twilio::SmsService.new('+905058059917').call
#Twilio::SmsService.new(user.phone_number).call

module Twilio
  class SmsService
    TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
    TWILIO_AUTH_TOKEN  = ENV['TWILIO_AUTH_TOKEN']
    TWILIO_FROM_PHONE  = ENV['TWILIO_FROM_PHONE']
    TWILIO_TEST_PHONE  = ENV['TWILIO_TEST_PHONE']
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
      return TWILIO_TEST_PHONE if Rails.env.development?

      to_phone_number
    end
  end
end
