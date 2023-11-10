class AddPrimaryKeyToVotes < ActiveRecord::Migration[7.0]
  def change
    add_column :votes, :id, :primary_key
  end
end
