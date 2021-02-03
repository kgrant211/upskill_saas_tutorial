class ChangeQuotesTable < ActiveRecord::Migration[5.0]
  def change
     add_column :quotes, :email, :string
     add_column :quotes, :name, :string
  end
end
