class CreateJoinTableUsersCandidates < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :candidates do |t|
      t.index [:user_id, :candidate_id], unique: true
    end
  end
end
