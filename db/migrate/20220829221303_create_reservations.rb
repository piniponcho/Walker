class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :record, null: false, foreign_key: true
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
