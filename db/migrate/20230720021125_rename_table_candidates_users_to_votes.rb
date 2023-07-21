class RenameTableCandidatesUsersToVotes < ActiveRecord::Migration[7.0]
  def change
    rename_table :candidates_users, :votes
  end
end
