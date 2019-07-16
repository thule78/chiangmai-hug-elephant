class AddColumnsToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :name, :string
    add_column :contacts, :email, :string
    add_column :contacts, :content, :text
  end
end
