class AddBusinessTitle < ActiveRecord::Migration[5.0]
  def change 
    add_column :profiles, :business_name, :string
  end
end
