class AddForeginKeyNominationIdToVotes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :votes, :nominations, column: :nomination_id
  end
end
