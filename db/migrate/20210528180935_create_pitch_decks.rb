class CreatePitchDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :pitch_decks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
