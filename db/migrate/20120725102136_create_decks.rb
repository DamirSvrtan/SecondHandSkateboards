class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.integer :user_id
      t.string :marka
      t.string :sirina_daske
      t.boolean :sa_gripom
      t.string :koristenost
      t.string :starost
      t.boolean :zamjena
      t.string :cijena

      t.timestamps
    end
	add_index :decks, [:user_id, :created_at]
  end
end
