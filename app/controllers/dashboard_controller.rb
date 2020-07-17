class DashboardController < ApplicationController
  def index
    @days = MenuItem.group(:day).order(day: :desc)
  end
end
