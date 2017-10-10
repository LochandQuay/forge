class CreateDecks < ActiveRecord::Migration[5.1]
  def change
    create_table :decks do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.string :type, default: "Standard"
      t.integer :class_id, null: false

      t.timestamps
    end

    add_index :decks, [:name, :type, :class_id, :user_id], unique: true
    add_index :decks, :type
    add_index :decks, :class_id
    add_index :decks, :user_id
  end
end
