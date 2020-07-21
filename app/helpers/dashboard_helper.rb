module DashboardHelper
  def select_days(day, course)
    MenuItem.where(day: day, course: course).all
  end

  def check_day(day)
    day == Date.today
  end
end
