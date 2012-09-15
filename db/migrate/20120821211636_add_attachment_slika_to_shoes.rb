class AddAttachmentSlikaToShoes < ActiveRecord::Migration
  def change
        add_attachment :shoes, :slika
  end
end
