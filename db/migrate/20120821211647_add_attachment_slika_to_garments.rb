class AddAttachmentSlikaToGarments < ActiveRecord::Migration
  def change
        add_attachment :garments, :slika
  end
end
