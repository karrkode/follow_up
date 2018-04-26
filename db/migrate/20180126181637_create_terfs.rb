class CreateTerfs < ActiveRecord::Migration[5.0]
  def change
    create_table :terfs do |t|
      t.integer :organization_id
      t.integer :upload_id

      t.timestamps
    end
  end
end
