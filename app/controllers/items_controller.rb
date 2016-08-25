class ItemsController < ApplicationController

  def index
    @items = Item.visible_to(current_user)
  end
  #initialize task as instance variable
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user), notice: "\"#{@item.name}\" was added successfully." }
        format.js
      end    
    else 
      flash[:error] = "Error adding item. Please try again."
      redirect_to user_path(current_user)
    end  
  end
    
  # def destroy
  #   @item = Item.find(params[:id])
  #   name = @item.name
  #     if @item.destroy
  #       flash[:notice] = "\"#{name}\" was deleted successfully."
  #     else
  #       flash[:error] = "There was an error deleting the item. Please try again."
  #     end

  #   respond_to do |format|
  #     format.html { redirect_to user_path(current_user) }
  #     format.js
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end