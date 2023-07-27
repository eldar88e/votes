class CreateSmsVerifications < ActiveRecord::Migration[7.0]
  def change
    create_table :sms_verifications do |t|
      t.integer :phone, null: false
      t.integer :user_id, null: false
      t.string :status, default: nil

      t.timestamps
    end

    add_foreign_key :sms_verifications, :users, column: :user_id
  end
end
