class AddAttachmentSlikaToSkates < ActiveRecord::Migration
  def change
        add_attachment :skates, :slika
  end
end
