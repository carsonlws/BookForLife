class Book < ApplicationRecord

  has_many :ordered_books
  has_many :orders, through: :ordered_books
  belongs_to :category

end
