class ItemsController < ApplicationController
 
  def create
    @list = List.find(list_params)
    @item = Item.new(item_params)

    @item.list = @list
    @item.user = current_user

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


 
