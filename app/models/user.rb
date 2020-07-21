class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin]

  before_save :set_admin

  private

  def set_admin
    self.role = "admin" if User.count == 0
  end
end
