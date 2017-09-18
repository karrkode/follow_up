class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|

    	t.string :name, uniqueness: true
    	t.string :website

      t.timestamps
    end
  end
end
