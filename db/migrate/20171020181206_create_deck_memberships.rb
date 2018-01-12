class CreateDeckMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :deck_memberships do |t|
      t.integer :deck_id, null: false
      t.integer :card_id, null: false
    end

    add_index :deck_memberships, :deck_id
    add_index :deck_memberships, :card_id
    add_index :deck_memberships, [:deck_id, :card_id]
  end
end