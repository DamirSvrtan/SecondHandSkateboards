class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.integer :user_id
      t.string :marka
      t.string :sirina1
      t.string :sirina2
      t.string :visina
      t.string :koristenost
      t.string :starost
      t.boolean :zamjena
      t.string :cijena
      t.string :dodatan_opis

      t.timestamps
    end
    add_index :trucks, [:user_id, :created_at]
  end
end
