class Api::V1::OrdersController < ApplicationController
  def index
    if current_user.admin?
      orders = Order.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).all

      render json: OrderSerializer.new(orders)
    else
      flash[:notice] = "You didn't permited for this page"
      redirect_to root_path
    end
  end
end
