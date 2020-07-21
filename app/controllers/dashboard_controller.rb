class DashboardController < ApplicationController
  def index
    @days = MenuItem.pluck(:day).uniq.reverse.last(7)
  end
end
