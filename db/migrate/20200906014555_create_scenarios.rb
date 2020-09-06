class CreateScenarios < ActiveRecord::Migration[6.0]
  def change
    create_table :scenarios do |t|
      t.string :name
      t.string :features, array: true, default: []
      t.references :pack, null: false

      t.index :name, unique: true
      t.foreign_key :packs

      t.timestamps
    end
  end
end
