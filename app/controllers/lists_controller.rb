class ListsController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books= Book.all
    
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/lists'
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created "
      redirect_to list_path(:id)
    else
      render :new
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
