class ListsController < ApplicationController
  def new
  end

  def index
    @book = Book.new
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
      redirect_to list_path(@book.id)
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    list.update(book_params)
    redirect_to list_path(@book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
