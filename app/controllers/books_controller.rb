class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  end

  def new
  	@book = Book.new
  	@books = Book.all.order(id: "asc")
  end

  def create
  	book = Book.new(book_params)
  	book.save
  	redirect_to book_path(book), notice: "Book was successfully created."
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book), notice: "Book was successfully updated."
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to new_book_path, notice: "Book was successfully destroyed."
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
