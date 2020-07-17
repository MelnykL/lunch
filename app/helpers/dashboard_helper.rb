module DashboardHelper
  def days 
    ((Date.today - 7.days)..Date.today).to_a.reverse
  end

  def select_days(day, course)
    MenuItem.where(day: day, course: course).all
  end
end
