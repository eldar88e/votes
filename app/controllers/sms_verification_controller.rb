class SmsVerificationController < ApplicationController
  #before_action :authenticate_user! # Проверка аутентификации пользователя

  attr_reader :user

  def new
    @email = flash[:email]
  end

  def create
    user = User.find_by(email: strong_params[:email])
    return redirect_to new_user_session_path if user.nil?

    code_db = SmsVerification.where(user_id: user.id).order(created_at: :desc).first
    if code_db&.code == strong_params[:sms_code].to_i
      user.update(status: true)
      sign_in(:user, *user)
      redirect_to root_path, notice: "Вход успешно выполнен!"
    else
      flash[:email] = strong_params[:email]
      redirect_to enter_sms_code_path, alert: "Неверный SMS-код. Попробуйте еще раз."
    end
  end

  private

  def strong_params
    params.require(:sms_verification).permit(:email, :sms_code)
  end
end
