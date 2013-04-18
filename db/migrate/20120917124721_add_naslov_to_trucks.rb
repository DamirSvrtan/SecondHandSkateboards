class AddNaslovToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :naslov, :string

  end
end
