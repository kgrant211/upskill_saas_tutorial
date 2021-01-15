class RemoveProfileIds < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :profile_id
    remove_column :locations, :profiles_id
  end
end
