class CartController < ApplicationController

  before_action :read_cart, only: [:show, :add_item, :update_book, :remove_book]
  after_action :write_cart, only: [:add_item, :clear_cart, :update_book, :remove_book]

  def show
    @books = []
    @totalprice = 0
    @cart.each do |book_id,quantity|

      book = Book.find_by(id: book_id)
      book.define_singleton_method(:quantity) do
        quantity
      end

      # book.define_singleton_method(:total_price) do
      #   "%.2f" % (self.price * quantity.to_i)
      # end

      @books << book

      @totalprice += book.price.to_f * book.quantity.to_i
    end
  end

  def add_item
    if @cart[params[:book_id]]
      @cart[params[:book_id]] = @cart[params[:book_id]].to_i + params[:quantity].to_i
    else
      @cart[params[:book_id]] = params[:quantity]
    end
  end

  def clear_cart
    @cart = {}
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

  def update_book
    if @cart[params[:book_id]]
      @cart[params[:book_id]] = params[:quantity]
    end
    redirect_to cart_path
  end

  def remove_book
    @cart.delete params[:book_id]
    redirect_to cart_path
  end
end
