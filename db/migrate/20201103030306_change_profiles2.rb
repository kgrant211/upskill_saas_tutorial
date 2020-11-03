class ChangeProfiles2 < ActiveRecord::Migration[5.0]
  def change
    rename_column :profiles, :job_title, :services_offered
  end
end
