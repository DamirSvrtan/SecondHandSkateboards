class AddAttachmentSlikaToHats < ActiveRecord::Migration
  def change
        add_attachment :hats, :slika
  end
end
