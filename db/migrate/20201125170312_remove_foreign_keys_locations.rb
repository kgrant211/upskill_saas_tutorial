class RemoveForeignKeysLocations < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :locations, :branches
  end
end
