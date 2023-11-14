class TranslateCandidates < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        Candidate.create_translation_table!({ title: :string, description: :text },
                                            { migrate_data: true, remove_source_columns: true })
      end
      dir.down do
        Candidate.drop_translation_table! migrate_data: true
      end
    end
  end
end
