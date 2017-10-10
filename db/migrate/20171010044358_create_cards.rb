class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :card_id, null: false
      t.string :dbf_id, null: false
      t.string :name, null: false
      t.string :card_set, null: false
      t.string :type, null: false
      t.string :faction, null: false
      t.string :rarity, null: false
      t.integer :cost, null: false
      t.integer :attack
      t.integer :health
      t.integer :armor
      t.string :text
      t.string :flavor, null: false
      t.string :artist, null: false
      t.boolean :collectible, null: false
      t.boolean :elite, null: false
      t.string :race, null: false
      t.string :player_class, null: false
      t.string :img, null: false
      t.string :img_gold, null: false
      t.string :how_to_get
      t.string :how_to_get_gold
      t.string :locale

      t.timestamps
    end

    add_index :cards, :card_id
    add_index :cards, :name
    add_index :cards, :card_set
    add_index :cards, :player_class
  end
end
