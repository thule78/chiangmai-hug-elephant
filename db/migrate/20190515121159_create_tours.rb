class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :details
      t.string :location
      t.string :photo
      t.integer :price
      t.string :provider
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end
end
