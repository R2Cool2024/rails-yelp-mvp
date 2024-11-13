class RenameColumnRestaurants < ActiveRecord::Migration[7.1]
  def change
    rename_column :restaurants, :phone_numer, :phone_number
  end
end
