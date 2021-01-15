class EditLocationsTable < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :locations, column: :profile_id
    remove_foreign_key :locations, column: :user_id
    rename_column :locations, :zip_codes, :zip_code
  end
end
