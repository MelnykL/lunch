class OrdersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @q = Order.includes(:user).group(:created_at).ransack(params[:q])
    @orders = @q.result
    @todays_orders = Order.includes(:user).where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).all
  end
end
