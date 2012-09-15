class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.integer :user_id
      t.string :naslov
      t.string :marka
      t.string :velicina
      t.string :koristenost
      t.string :starost
      t.boolean :zamjena
      t.string :cijena
      t.string :dodatan_opis

      t.timestamps
    end
	        add_index :shoes, [:user_id, :created_at]
  end
end
