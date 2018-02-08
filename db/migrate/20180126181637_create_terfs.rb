class CreateTerfs < ActiveRecord::Migration[5.0]
  def change
    create_table :terfs do |t|
      t.integer :owner_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
