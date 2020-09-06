class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities do |t|
      t.string :alter_ego, null: false
      t.string :hero, null: false
      t.string :features, array: true, default: []
      t.references :pack, null: false

      t.index [:alter_ego, :hero], unique: true
      t.index :alter_ego
      t.index :hero
      t.foreign_key :packs

      t.timestamps
    end
  end
end
