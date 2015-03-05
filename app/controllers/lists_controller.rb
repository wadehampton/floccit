class ListsController < ApplicationController
  before_action :authenticate_user! # users must be signed in before any lists_controller method

  def index
    @lists = List.paginate(page: params[:page], per_page: 10)
  end

  def show
    @list = List.find(params[:id])
  end

  def new 
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user

    if @list.save
      flash[:notice] = "List was saved."
    else
      flash[:error] = "There was error saving the list. Please try again."
    end
    redirect_to @list
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the list. Please try again."
      render :edit
    end
  end

  def destroy 
    @list = List.find(params[:id])
    title = @list.title

    if @list.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @list
    else
      flash[:error] = "There was a problem deleting the list."
      render :show
    end
  end
end

private

  def list_params
     params.require(:list).permit(:title)
  end
