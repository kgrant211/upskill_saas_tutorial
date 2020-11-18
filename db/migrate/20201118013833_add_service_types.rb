class AddServiceTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :short_term, :string
    add_column :profiles, :long_term, :string
  end
end
