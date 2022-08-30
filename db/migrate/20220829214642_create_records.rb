class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :route, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :available

      t.timestamps
    end
  end
end
