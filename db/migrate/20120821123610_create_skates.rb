class CreateSkates < ActiveRecord::Migration
  def change
    create_table :skates do |t|
      t.integer :user_id
      t.string :koristenost
      t.string :daska_marka
      t.string :daska_sirina
      t.string :osovine_marka
      t.string :osovine_sirina
      t.string :kotaci_marka
      t.string :kotaci_radijus
      t.boolean :sa_gripom
      t.string :cijena
      t.string :dodatan_opis

      t.timestamps
    end
	add_index :skates, [:user_id, :created_at]
  end
end
