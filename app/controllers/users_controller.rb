class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id] || current_user.id)
    # @items = @user.items
  end
  
end