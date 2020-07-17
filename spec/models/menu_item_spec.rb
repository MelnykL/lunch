require 'rails_helper'

RSpec.describe MenuItem, type: :model do
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
end
