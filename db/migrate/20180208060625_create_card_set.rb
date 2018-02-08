class CreateCardSet < ActiveRecord::Migration[5.1]
  def change
    create_table :card_sets do |t|
      t.string :name, null: false
      t.date :release_date
      t.string :type
      t.boolean :standard, null: false
    end

    add_index :card_sets, :name
    add_index :card_sets, :release_date
    add_index :card_sets, :standard
    add_index :card_sets, :type
  end
end
