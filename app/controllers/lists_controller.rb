class ListsController < ApplicationController
  before_action :authenticate_user! # users must be signed in before any lists_controller method

  def show
    @list = current_user.list
  end

  def index 
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def update
    @lists = List.find(params[:id])
  end

  def create 
    @list = List.new(params.require(:list).permit(:title, :body))
    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end
