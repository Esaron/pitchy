class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, index: { unique: true }
      t.string :description

      t.timestamps
    end
  end
end
