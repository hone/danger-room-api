class CreatePacks < ActiveRecord::Migration[6.0]
  def change
    create_enum :pack_type, ["core", "hero", "scenario", "campaign", "print-n-play"]
    create_table :packs do |t|
      t.string :name, null: false
      t.enum :pack_type, enum_name: :pack_type, null: false

      t.index :name, unique: true

      t.timestamps
    end
  end
end
