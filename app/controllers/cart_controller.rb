class CartController < ApplicationController

  before_action :read_cart, only: [:show, :add_item, :remove_book]
  after_action :write_cart, only: [:add_item, :clear_cart, :remove_book]

  def show
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

  def remove_book
    @cart.delete params[:book_id]
    redirect_to cart_path
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
