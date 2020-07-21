require 'rails_helper'

RSpec.describe "Users", type: :request do
  context "GET /index when user not log in" do
    it "redirect to log in page" do
      get menu_items_path
      expect(response).to have_http_status(302)
    end
  end

  context "Sign in" do
    let(:admin) { create(:admin) }
    let(:user) { create(:user) }
    let(:cart) { create(:cart, user_id: user.id) }
    let(:menu_item) { create(:menu_item) }
    before(:each) do
      sign_in admin
    end

    it "does not render a different template" do
      get orders_path
      expect(response).to_not render_template(:show)
    end

    it "render index page" do
      get orders_path
      expect(response).to have_http_status(200)
    end

    it "delete user" do
      user.cart = cart
      delete user_url(user)
      expect(response).to redirect_to users_path
      follow_redirect!
      expect(response).to render_template(:index)
    end
  end
end
