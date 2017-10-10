class RemoveNullConstraintFromColumn < ActiveRecord::Migration[5.1]
  def change
    change_column_null :cards, :race, true
  end
end
