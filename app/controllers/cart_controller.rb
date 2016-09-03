class CartController < ApplicationController


  def show
    read_cart

    @books = []
    @cart.each do |book_id,quantity|

      book = Book.find_by(id: book_id)
      book.define_singleton_method(:quantity) do
        quantity
      end
      @books << book
    end
  end

  def add_item
    read_cart
    if @cart[params[:book_id]]
      @cart[params[:book_id]] = @cart[params[:book_id]].to_i + params[:quantity].to_i
    else
      @cart[params[:book_id]] = params[:quantity]
    end
    # binding.pry

    write_cart
  end

  def clear_cart
    @cart = {}
    write_cart
    redirect_to cart_path
  end

  def write_cart
    cookies[:cart] = JSON.generate @cart
  end

  def read_cart
    if cookies[:cart]
      @cart = JSON.parse cookies[:cart]
    else
      @cart = {}
    end
  end

  # @cart = {
  #   '5': '999',
  #   '12': '100'
  # }

  # request = {
  #   "item_id": "12",
  #   "quantity": "5"
  # }
end
