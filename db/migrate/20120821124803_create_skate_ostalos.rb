class CreateSkateOstalos < ActiveRecord::Migration
  def change
    create_table :skate_ostalos do |t|
      t.integer :user_id
      t.string :naslov
      t.string :opis
      t.string :cijena

      t.timestamps
    end
        add_index :skate_ostalos, [:user_id, :created_at]
  end
end
