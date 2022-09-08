class AddPriceToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :price, :integer
  end
end
