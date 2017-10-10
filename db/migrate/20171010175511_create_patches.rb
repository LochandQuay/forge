class CreatePatches < ActiveRecord::Migration[5.1]
  def change
    create_table :patches do |t|
      t.string :patch, null: false
    end

    add_index :patches, :patch
  end
end
