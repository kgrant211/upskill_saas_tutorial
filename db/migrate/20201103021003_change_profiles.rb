class ChangeProfiles < ActiveRecord::Migration[5.0]
  def change
    change_table :profiles do |t|
      t.string :business_name
      t.rename :job_title, :services_offered # t.string -> t.rename
    end
  end
  def change
    create_table :locations do |t|
      t.references :user
      t.references :profile
      t.string :zip_codes
    end
  end
end
