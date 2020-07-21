require 'rails_helper'

RSpec.describe "Api::V1::Orders", type: :request do
  context "GET /index when user not log in" do
    it "redirect to log in page" do
      get '/api/v1/orders'
      expect(response).to have_http_status(302)
    end
  end

  context "Sign in" do
    let(:admin) { create(:admin) }
    let(:menu_item) { create(:menu_item) }
    before(:each) do
      sign_in admin
    end

    it "show json orders" do
      get '/api/v1/orders'
      expect(response).to have_http_status(200)
    end
  end
end
