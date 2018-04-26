class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.string :name
      t.integer :uploader_id
      t.integer :organization_id
      t.string :s3_id

      t.timestamps
    end
  end
end
