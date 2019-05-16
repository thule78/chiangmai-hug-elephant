class AddPhotoOneToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :photo_one, :string
    add_column :tours, :photo_two, :string
    add_column :tours, :photo_three, :string
  end
end
