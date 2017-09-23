class ChangeFollowers < ActiveRecord::Migration[5.0]
  def change
  	add_column :followers, :organizer_id, :string
  	add_column :followers, :organization_id, :string
  end
end
