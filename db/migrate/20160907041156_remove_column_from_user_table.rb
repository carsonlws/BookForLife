class RemoveColumnFromUserTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :name, :string
    remove_column :users, :address, :text
    remove_column :users, :phone, :integer
  end
end
