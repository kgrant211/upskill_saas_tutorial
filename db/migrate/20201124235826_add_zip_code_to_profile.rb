class AddZipCodeToProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_locations do |t|
  t.belongs_to :location
  t.belongs_to :profile
  t.timestamps
    end
  end
end
