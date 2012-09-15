class CreateGarments < ActiveRecord::Migration
  def change
    create_table :garments do |t|
      t.integer :user_id
      t.string :naslov
      t.string :vrsta
      t.string :marka
      t.string :velicina
      t.string :koristenost
      t.string :starost
      t.boolean :zamjena
      t.string :cijena
      t.string :dodatan_opis

      t.timestamps
    end
        add_index :garments, [:user_id, :created_at]
  end
end
