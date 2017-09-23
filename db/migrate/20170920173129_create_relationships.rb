class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
    	t.references :user
    	t.references :follower
    	t.references :organization

    	t.timestamps 
    end
  end
end
