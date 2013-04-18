class AddZamjenaToSkates < ActiveRecord::Migration
  def change
    add_column :skates, :zamjena, :boolean

  end
end
