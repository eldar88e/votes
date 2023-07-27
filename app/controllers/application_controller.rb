class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def send_confirmation_code(resource)
    phone  = resource.phone.scan(/\d/).join('')
    twilio = Twilio::SmsService.new('+' + phone)
    twilio.call
    SmsVerification.create(phone: phone,
                           user_id: resource.id,
                           status: twilio.status,
                           code: twilio.code)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
  end
end
