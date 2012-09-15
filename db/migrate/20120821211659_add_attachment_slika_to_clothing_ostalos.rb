class AddAttachmentSlikaToClothingOstalos < ActiveRecord::Migration
  def change
        add_attachment :clothing_ostalos, :slika
  end
end
