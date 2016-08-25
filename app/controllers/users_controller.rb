class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id] || current_user.id)
    @items = @user.items
  end

  def update
    
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end