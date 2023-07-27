class AddColumnCodeSmsVerificationChangeTypePhone < ActiveRecord::Migration[7.0]
  def change
    add_column :sms_verifications, :code, :integer
    change_column :sms_verifications, :phone, :string
  end
end
