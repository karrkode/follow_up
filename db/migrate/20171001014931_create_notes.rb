class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
    	t.text :info
    	t.string :notable_type
    	t.integer :notable_id
    end
  end
end
