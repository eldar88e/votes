class AddColumnUserStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :status, :boolean
  end
end
