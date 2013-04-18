class AddZamjenaToSkateOstalos < ActiveRecord::Migration
  def change
    add_column :skate_ostalos, :zamjena, :boolean

  end
end
