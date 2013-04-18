class AddStarostToSkates < ActiveRecord::Migration
  def change
    add_column :skates, :starost, :string

  end
end
