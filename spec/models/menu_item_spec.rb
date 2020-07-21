require 'rails_helper'

RSpec.describe MenuItem, type: :model do

  context 'associations' do
    it { should have_and_belong_to_many(:carts).class_name('Cart') }
    it { should have_and_belong_to_many(:orders).class_name('Order') }
  end

  context "create menu item" do
    let(:item) { MenuItem.new(name: "Test", price: 10, course: 0) }
    
    it "valid value" do
      expect(item.save).to be_truthy
    end

    it "must add day before create" do
      item.save
      expect(item.day).to eq(Date.today)
    end
  end

  context "didn't create item" do
    it "check valid name" do
      item = MenuItem.new(name: nil, price: 10, course: 0)
      expect(item.save).to be_falsy
    end

    it "check valid name" do
      item = MenuItem.new(name: "name", price: -9, course: 0)
      expect(item.save).to be_falsy
    end

    it "check valid name" do
      item = MenuItem.new(name: "name", price: 10, course: nil)
      expect(item.save).to be_falsy
    end
  end

  context "check_count_items_for_course" do
    let(:user) { create(:user) }
    let(:menu_item) { create(:menu_item, course: 0) }

    it "must be 1" do
      cart = Cart.new(user_id: user.id)
      cart.menu_items << menu_item
      cart.save
      count = MenuItem.check_count_items_for_course(cart, menu_item)
      expect(count).to eq(1)
    end
  end
end
