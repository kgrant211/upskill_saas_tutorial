class RemoveLocationsColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :user_id, :integer
    remove_column :locations, :profile_id, :integer
  end
end
