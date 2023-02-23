class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def index
    @book = Book.all
  end

  def show
  end

  def edit
  end

  def create
    list = Book.new(list_params)
    if @book.save
      flash[:notice] = "投稿が成功しました"
      redirect_to list_path(list.id)
    else
      render :new
    end
  end
end
