class SmsVerificationsAddIndexToUserId < ActiveRecord::Migration[7.0]
  def change
    add_index :sms_verifications, :user_id
  end
end
