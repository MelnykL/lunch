class Cart < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :menu_items

  private

  def self.total_price(cart)
    cart.menu_items.sum(:price)
  end
end
