module MenuItemsHelper
  def current_day
    Date.today.strftime("%A %d.%m.%Y")
  end
end
