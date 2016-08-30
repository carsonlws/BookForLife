class AddCategoryIdToBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :category
    add_column :books, :category_id, :integer
  end
end
