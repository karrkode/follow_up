class DropAddressFromFollowers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :followers, :address, :string
  end
end
