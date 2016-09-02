class Order < ApplicationRecord

  has_many :ordered_books
  has_many :books, through: :ordered_books
  belongs_to :user

end
