class Book < ApplicationRecord

  has_many :ordered_books
  has_many :orders, through: :ordered_books
  belongs_to :category
  searchkick

  products = Product.search "apples"
  products.each do |product|
    puts product.name
  end

  mount_uploader :image, ImageUploader

end
