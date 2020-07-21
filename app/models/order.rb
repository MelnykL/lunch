class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :menu_items

  def set_sum
    self.total_price = self.menu_items.sum(:price)
    self.save
  end
end
