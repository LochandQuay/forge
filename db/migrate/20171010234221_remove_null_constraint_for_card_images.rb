class RemoveNullConstraintForCardImages < ActiveRecord::Migration[5.1]
  def change
    change_column_null :cards, :faction, true
    change_column_null :cards, :rarity, true
    change_column_null :cards, :cost, true
    change_column_null :cards, :img, true
    change_column_null :cards, :img_gold, true
    change_column_null :cards, :flavor, true
    change_column_null :cards, :artist, true
    change_column_null :cards, :collectible, true
    change_column_null :cards, :elite, true
  end
end