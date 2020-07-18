class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.where(day: Date.today).group(:course, :id)
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      flash[:notice] = "Item Created"
      redirect_to menu_items_path
    else
      flash[:notice] = "Can't Create. Please Try Again"
      redirect_to new_menu_item_path
    end
  end

  def edit
    menu_item
  end

  def update
    if menu_item.update(menu_item_params)
      flash[:notice] = "Item Updated"
      redirect_to menu_items_path
    else
      flash.now[:notice] = "Can't Update. Please Try Again"
      render :edit
    end
  end

  def destroy
    if menu_item.destroy
      flash[:notice] = "Item Destroyed"
      redirect_to menu_items_path
    else
      flash[:notice] = "Can't Destroy. Please Try Again"
      redirect_to menu_items_path
    end
  end

  def add_to_cart
    @cart = current_user.cart || current_user.create_cart
    if MenuItem.check_count_items_for_course(@cart, menu_item) == 0
      @cart.menu_items << menu_item
      @cart.save
      flash[:notice]= "#{menu_item.name} add to the cart!"
      redirect_to root_path
    else
      flash[:notice]= "Sorry you add one possition of this course already. Please, check your cart!"
      redirect_to root_path
    end
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :price, :course, :image)
  end

  def menu_item
    @menu_item ||= MenuItem.find(params[:id])
  end
end
