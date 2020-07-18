module DashboardHelper
  def days 
    ((Date.today - 6.days)..Date.today).to_a.reverse
  end

  def select_days(day, course)
    MenuItem.where(day: day, course: course).all
  end

  def check_day(day)
    day == Date.today
  end
end
