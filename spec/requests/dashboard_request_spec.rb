require 'rails_helper'

RSpec.describe "Dashboards", type: :request do

  context "GET /index when user not log in" do
    it "redirect to log in page" do
      get root_path
      expect(response).to have_http_status(302)
    end
  end

  context "GET /index" do
    let(:user) { create(:user) }
    before(:each) do
      sign_in user
    end

    it "render index page" do
      get root_path
      expect(response).to have_http_status(200)
    end 
  end
end
