class Order < ApplicationRecord

  has_many :books, through: :ordered_book
  belongs_to :user

end
