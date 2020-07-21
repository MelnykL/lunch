require 'rails_helper'

RSpec.describe "MenuItems", type: :request do
  context "GET /index when user not log in" do
    it "redirect to log in page" do
      get menu_items_path
      expect(response).to have_http_status(302)
    end
  end

  context "Sign in" do
    let(:admin) { create(:admin) }
    let(:menu_item) { create(:menu_item) }
    before(:each) do
      sign_in admin
    end

    it "does not render a different template" do
      get menu_items_path
      expect(response).to_not render_template(:show)
    end

    it "render index page" do
      get menu_items_path
      expect(response).to have_http_status(200)
    end
    
    it "create menu item" do
      get new_menu_item_path
      expect(response).to render_template(:new)
  
      post "/menu_items", params: {"menu_item"=>{"name"=>"New test", "price"=>"10", "course"=>"Drink"}}
      expect(response).to redirect_to menu_items_path
      follow_redirect!
      expect(response).to render_template(:index)
    end

    it "update menu item" do
      get edit_menu_item_path(menu_item)
      expect(response).to render_template(:edit)
  
      put menu_item_path(menu_item), params: {"menu_item"=>{"name"=>"New name", "price"=>"10", "course"=>"Drink"}}
      expect(response).to redirect_to menu_items_path
      follow_redirect!
      expect(response).to render_template(:index)
    end

    it "deletes a menu item" do
      delete menu_item_url(menu_item)
      expect(response).to redirect_to menu_items_path
      follow_redirect!
      expect(response).to render_template(:index)
    end

    it "add menu item to cart" do
      post add_to_cart_menu_item_path(menu_item)
      expect(response).to redirect_to root_path
    end
  end
end
