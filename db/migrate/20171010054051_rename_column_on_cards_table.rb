class RenameColumnOnCardsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :cards, :type, :card_type
    add_column :cards, :durability, :integer
  end
end
