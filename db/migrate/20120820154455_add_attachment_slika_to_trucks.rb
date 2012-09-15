class AddAttachmentSlikaToTrucks < ActiveRecord::Migration
  def change
        add_attachment :trucks, :slika
  end
end
