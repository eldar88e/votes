class AddUniqueKeyToNomination < ActiveRecord::Migration[7.0]
  def change
    add_index :nominations, [:title], unique: true
  end
end
