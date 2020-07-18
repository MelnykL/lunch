class CartsController < ApplicationController
  def index
    cart
  end

  def destroy
    if cart.delete
      flash[:notice] = "Cart is empty"
      redirect_to carts_path
    else
      flash[:notice] = "Can't Destroy. Please Try Again"
      redirect_to carts_path
    end
  end

  def confirm
    if  cart.menu_items.any?
        @order = current_user.orders.create
        @order.menu_items << @cart.menu_items
        @cart.menu_items.clear
        @order.set_sum
    end
    flash[:notice]= "Thank you for Your successful choice!"
    redirect_to root_path
  end

  private

  def cart
    @cart = current_user.cart
  end
end
