class AddAttachmentSlikaToWheels < ActiveRecord::Migration
  def change
	add_attachment :wheels, :slika
  end
end
