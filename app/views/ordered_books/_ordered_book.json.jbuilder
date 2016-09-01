json.extract! ordered_book, :id, :book_id, :order_id, :quantity, :created_at, :updated_at
json.url ordered_book_url(ordered_book, format: :json)