class CreateNominations < ActiveRecord::Migration[7.0]
  def change
    create_table :nominations do |t|
      t.string :title

      t.timestamps
    end
  end
end
