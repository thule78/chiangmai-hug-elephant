class AddProvideridToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :provider_id, :integer
  end
end
