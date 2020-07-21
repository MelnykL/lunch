require 'rails_helper'

RSpec.describe Cart, type: :model do

  context 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_and_belong_to_many(:menu_items).class_name('MenuItem') }
  end

  context "check total price" do
    let(:user) { create(:user) }
    let(:menu_item) { create(:menu_item, price: 10) }
    
    it "must be 10" do
      cart = Cart.new(user_id: user.id)
      cart.menu_items << menu_item
      cart.save
      expect(Cart.total_price(cart)).to eq(10)
    end
  end
end
