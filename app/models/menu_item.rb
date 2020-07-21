class MenuItem < ApplicationRecord
  has_one_attached :image
  has_and_belongs_to_many :carts
  has_and_belongs_to_many :orders
  
  validates :name, :price, :course, presence: true
  validates :price,  numericality: { greater_than: 0, less_than: 100 }

  enum course: [:First, :Main, :Drink]

  before_create :add_day

  private

  def add_day
    self.day = Date.today
  end

  def self.check_count_items_for_course(cart, menu_item)
    course = menu_item.course
    count = cart.menu_items.where(course: course).count
  end
end
