class CreateModularEncounterSets < ActiveRecord::Migration[6.0]
  def change
    create_table :modular_encounter_sets do |t|
      t.string :name, null: false
      t.integer :difficulty
      t.references :pack, null: false

      t.index :name, unique: true
      t.foreign_key :packs

      t.timestamps
    end
  end
end
