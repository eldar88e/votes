class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        SendConfirmationCodeJob.perform_later(resource)
        set_flash_message! :notice, :signed_up

        flash[:email] = resource.email
        redirect_to enter_sms_code_path,
                    notice: "Вы зарегистрированы, подтвердите свою учетную запись. Введите отправленный код из СМС."
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end
