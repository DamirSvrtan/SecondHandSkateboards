class AddAttachmentSlikaToSkateOstalos < ActiveRecord::Migration
  def change
        add_attachment :skate_ostalos, :slika
  end
end
