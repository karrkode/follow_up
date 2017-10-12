class AddFollowerLocationInformation < ActiveRecord::Migration[5.0]
  def change
  	add_column :followers, :street_number, :string
  	add_column :followers, :street_name, :string
  	add_column :followers, :neighborhood, :string
  	add_column :followers, :city, :string
  	add_column :followers, :county, :string
  	add_column :followers, :state, :string
  	add_column :followers, :zip, :string
  	add_column :followers, :latitude, :float
  	add_column :followers, :longitude, :float
  end
end
