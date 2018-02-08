class CreateTerfEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :terf_entries do |t|
      t.string :first_name
      t.string :last_name
      t.integer :street_number
      t.string :street_name
      t.string :state
      t.integer :zip
      t.string :county

      t.timestamps
    end
  end
end
