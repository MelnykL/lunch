require 'rails_helper'

RSpec.describe "Carts", type: :request do
  context "GET /index when user not log in" do
    it "redirect to log in page" do
      get carts_path
      expect(response).to have_http_status(302)
    end
  end

  context "Sign in" do
    let(:user) { create(:user) }
    let!(:cart) { create(:cart, user_id: user.id) }
    before(:each) do
      sign_in user
    end

    it "does not render a different template" do
      get carts_path
      expect(response).to_not render_template(:show)
    end

    it "render index page" do
      get carts_path
      expect(response).to have_http_status(200)
    end

    it "delete cart" do
      delete cart_url(cart)
      expect(response).to redirect_to carts_path
      follow_redirect!
      expect(response).to render_template(:index)
    end

    it "confirm cart order" do
      post confirm_cart_path(cart)
      expect(response).to redirect_to root_path
    end
  end
end
