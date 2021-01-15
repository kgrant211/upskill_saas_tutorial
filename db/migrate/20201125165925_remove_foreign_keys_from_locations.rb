class RemoveForeignKeysFromLocations < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :locations, :users
    remove_foreign_key :locations, :profiles
  end
end
