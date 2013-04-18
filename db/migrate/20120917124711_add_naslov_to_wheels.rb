class AddNaslovToWheels < ActiveRecord::Migration
  def change
    add_column :wheels, :naslov, :string

  end
end
