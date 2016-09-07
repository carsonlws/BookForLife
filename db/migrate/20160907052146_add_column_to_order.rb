class AddColumnToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :totalprice, :float
  end
end
