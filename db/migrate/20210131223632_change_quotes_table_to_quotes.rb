class ChangeQuotesTableToQuotes < ActiveRecord::Migration[5.0]
  def change
    rename_table :quotes_tables, :quotes
  end
end
