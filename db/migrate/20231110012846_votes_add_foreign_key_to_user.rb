class VotesAddForeignKeyToUser < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :votes, :users, column: :user_id
  end
end
