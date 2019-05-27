class AddDurationToTour < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :duration, :string
    add_column :tours, :destination, :string
  end
end
