class CreateSlides < ActiveRecord::Migration[6.1]
  def change
    create_table :slides do |t|
      t.references :pitch_deck, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
