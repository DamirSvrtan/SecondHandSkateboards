class AddDodatanOpisToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :dodatan_opis, :string
  end
end
