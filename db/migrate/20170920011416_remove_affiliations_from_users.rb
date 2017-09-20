class RemoveAffiliationsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :affiliation, :string
  end
end
