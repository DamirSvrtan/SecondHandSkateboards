class AddNaslovToSkates < ActiveRecord::Migration
  def change
    add_column :skates, :naslov, :string

  end
end
