class AddNaslovToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :naslov, :string

  end
end
