class AddNominationRefToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_reference :candidates, :nomination, null: false, foreign_key: true
  end
end
