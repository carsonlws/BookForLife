class CreateOrderedBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :ordered_books do |t|
      t.integer :book_id
      t.integer :order_id
      t.integer :quantity

      t.timestamps
    end
  end
end
