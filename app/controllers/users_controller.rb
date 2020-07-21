class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def destroy
    user = User.find(params[:id])
    user.cart.destroy if user.cart
    user.orders.destroy_all if user.orders
    if user.delete
      flash[:notice] = "User successfully deleted"
      redirect_to users_path
    else
      flash[:notice] = "Can't delete. Try again"
      redirect_to users_path
    end
  end
end
