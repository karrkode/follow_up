class AddTimestampsToNotes < ActiveRecord::Migration[5.0]
  def change
  	add_column :notes, :created_at, :datetime
    add_column :notes, :updated_at, :datetime
  end
end
