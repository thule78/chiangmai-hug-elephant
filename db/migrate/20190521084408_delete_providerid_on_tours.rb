class DeleteProvideridOnTours < ActiveRecord::Migration[5.2]
  def change
    remove_column :tours, :provider_id
  end
end
