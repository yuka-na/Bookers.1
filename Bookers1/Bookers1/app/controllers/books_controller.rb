class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end
  def new
        @book = Book.new
        @books = Book.all
  end
  def create
        book = Book.new(book_params)
        book.save
        flash[:notice]="Book was successfully created."
        redirect_to new_book_path
    end
  def index
  	@books = Book.all
  end


  def edit
  	@book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
    flash[:notice]="Book was successfully updated."
end
  def destroy
        book = Book.find(params[:id])
        book.destroy
        flash[:notice]="Book was successfully destroyed."
        redirect_to new_book_path
    end
  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
