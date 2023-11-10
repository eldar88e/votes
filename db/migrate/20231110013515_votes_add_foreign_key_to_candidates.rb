class VotesAddForeignKeyToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :votes, :candidates, column: :candidate_id
  end
end
