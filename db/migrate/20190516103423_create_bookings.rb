class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :customer_id
      t.references :tour, foreign_key: true
      t.integer :headcount
      t.datetime :date
      t.boolean :confirmed

      t.timestamps
    end
  end
end
