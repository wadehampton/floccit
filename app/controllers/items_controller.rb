class ItemsController < ApplicationController
  def create
    @list = current_user.list
    @item = current_user.items.build(post_params)
  end
end
