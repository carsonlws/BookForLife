class Book < ApplicationRecord

  has_many :orders, through: :ordered_book
  belongs_to :category

end
