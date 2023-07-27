class SessionsController < Devise::SessionsController

  def create
    user = User.find_by(email: strong_params[:email])
    if user.nil? || user.confirmed?
      self.resource = user
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      sms_verification = SmsVerification.where(user_id: user.id).order(created_at: :desc).first
      if sms_verification&.code && valid_time?(sms_verification.created_at)
        flash[:email] = user[:email]
        redirect_to enter_sms_code_path, alert: 'На ваш телефон ранее был отправлен смс-код. Пожалуйста, подтвердите свой аккаунт.'
      else
        send_confirmation_code(user)
        flash[:email] = user.email
        redirect_to enter_sms_code_path,
                    notice: "Вы зарегистрированы, подтвердите свою учетную запись. Введите отправленный код из СМС."
      end
    end
  end

  private

  def valid_time?(created_at)
    Time.now.utc < created_at.time + 5.minutes
  end

  def strong_params
    params.require(:user).permit(:email, :password, :remember_me)
  end
end