class BooksController < ApplicationController
  def top
  end

  def index
  	@books = Book.all
    @book =Book.new
  end

  def show
  	@book =Book.find(params[:id])
  end

  def new
  	@book =Book.new
  end
  
  def create
    @books = Book.all
  	@book = Book.new(book_params)
  	if @book.save
  	  redirect_to book_path(@book.id),notice: "successfully"
    else
      render "index"
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
    @books = Book.all
  	@book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id),notice: "successfully"
    else
      render :index
    end
  end

  def destroy
    @book = book.find_by(id: params[:id])
    if @book.destroy
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end