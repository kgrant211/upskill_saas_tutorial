class RemoveColumnsLocations < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :locations, name: "user_id"
    remove_foreign_key :locations, name: "profile_id"
  end
end
