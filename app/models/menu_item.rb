class MenuItem < ApplicationRecord
  has_one_attached :image
  
  validates :name, :price, :course, presence: true
  validates :price,  numericality: { greater_than: 0, less_than: 100 }

  enum course: [:First, :Main, :Drink]

  before_create :add_day

  private

  def add_day
    self.day = Date.today
  end
end
