class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :title
      t.text :description
      t.string :img

      t.timestamps
    end
  end
end
