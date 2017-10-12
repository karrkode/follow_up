class AddAddressToFollowers < ActiveRecord::Migration[5.0]
  def change
  	add_column :followers, :address, :string
  end
end
