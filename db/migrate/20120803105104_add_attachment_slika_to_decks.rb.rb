class AddAttachmentSlikaToDecks < ActiveRecord::Migration
  def change
    add_attachment :decks, :slika
  end
end

