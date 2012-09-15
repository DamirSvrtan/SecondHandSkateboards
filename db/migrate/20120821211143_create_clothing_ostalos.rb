class CreateClothingOstalos < ActiveRecord::Migration
  def change
    create_table :clothing_ostalos do |t|
      t.integer :user_id
      t.string :naslov
      t.string :opis
      t.string :cijena
      t.boolean :zamjena

      t.timestamps
    end
        add_index :clothing_ostalos, [:user_id, :created_at]
  end
end
