class ItemsController < ApplicationController

  def show
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end
 
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    @item.user = current_user
    @new_item = Item.new

      if @item.save
        flash[:notice] = "Item was saved successfully."
      else
        flash[:error] = "Error creating item. Please try again."
      end
      redirect_to @list 
  end


 private

 def item_params
    params.require(:item).permit(:body)
  end
end


 
