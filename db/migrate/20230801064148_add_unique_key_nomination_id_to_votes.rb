class AddUniqueKeyNominationIdToVotes < ActiveRecord::Migration[7.0]
  def change
    add_index :votes, [:user_id, :nomination_id], unique: true
  end
end
