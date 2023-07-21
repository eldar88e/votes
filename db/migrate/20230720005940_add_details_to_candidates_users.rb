class AddDetailsToCandidatesUsers < ActiveRecord::Migration[7.0]
  def change
    add_timestamps(:candidates_users)
  end
end
