class CreateWheels < ActiveRecord::Migration
  def change
    create_table :wheels do |t|
      t.integer :user_id
      t.string :marka
      t.string :radijus
      t.string :koristenost
      t.string :starost
      t.boolean :zamjena
      t.string :cijena
      t.string :dodatan_opis

      t.timestamps
    end
    add_index :wheels, [:user_id, :created_at]
  end
end
