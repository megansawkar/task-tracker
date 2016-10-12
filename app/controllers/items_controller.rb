class ItemsController < ApplicationController

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save!
      flash[:notice] = "Item was saved successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
