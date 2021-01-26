class CreateQuotesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes_tables do |t|
      t.string :description
    end
  end
end
