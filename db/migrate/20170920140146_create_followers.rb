class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.text :notes

      t.timestamps
    end
  end
end
