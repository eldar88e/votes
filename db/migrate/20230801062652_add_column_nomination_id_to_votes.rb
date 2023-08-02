class AddColumnNominationIdToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :nomination_id, :integer
  end
end
