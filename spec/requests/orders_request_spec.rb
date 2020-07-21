require 'rails_helper'

RSpec.describe "Orders", type: :request do
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
      get orders_path
      expect(response).to_not render_template(:show)
    end

    it "render index page" do
      get orders_path
      expect(response).to have_http_status(200)
    end
    
  end
end
