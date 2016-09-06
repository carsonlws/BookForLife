class ShippingController < ApplicationController

  def index
  end

  def order_confirmation

    @cart = JSON.parse cookies[:cart]
    @books = []
    @cart.each do |book_id,quantity|

      book = Book.find_by(id: book_id)
      book.define_singleton_method(:quantity) do
        quantity
      end
      @books << book
    end

  end
end
