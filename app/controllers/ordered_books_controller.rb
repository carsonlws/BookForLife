class OrderedBooksController < ApplicationController
  before_action :set_ordered_book, only: [:show, :edit, :update, :destroy]

  # GET /ordered_books
  # GET /ordered_books.json
  def index
    @ordered_books = OrderedBook.all
  end

  # GET /ordered_books/1
  # GET /ordered_books/1.json
  def show
  end

  # GET /ordered_books/new
  def new
    @ordered_book = OrderedBook.new
  end

  # GET /ordered_books/1/edit
  def edit
  end

  # POST /ordered_books
  # POST /ordered_books.json
  def create
    @ordered_book = OrderedBook.new(ordered_book_params)

    respond_to do |format|
      if @ordered_book.save
        format.html { redirect_to @ordered_book, notice: 'Ordered book was successfully created.' }
        format.json { render :show, status: :created, location: @ordered_book }
      else
        format.html { render :new }
        format.json { render json: @ordered_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ordered_books/1
  # PATCH/PUT /ordered_books/1.json
  def update
    respond_to do |format|
      if @ordered_book.update(ordered_book_params)
        format.html { redirect_to @ordered_book, notice: 'Ordered book was successfully updated.' }
        format.json { render :show, status: :ok, location: @ordered_book }
      else
        format.html { render :edit }
        format.json { render json: @ordered_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordered_books/1
  # DELETE /ordered_books/1.json
  def destroy
    @ordered_book.destroy
    respond_to do |format|
      format.html { redirect_to ordered_books_url, notice: 'Ordered book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_book
      @ordered_book = OrderedBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordered_book_params
      params.require(:ordered_book).permit(:book_id, :order_id, :quantity)
    end
end
