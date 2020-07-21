require 'rails_helper'

RSpec.describe DashboardHelper, type: :helper do
  describe "helpers" do
    let(:menu_item) { create(:menu_item) }
    it "count must be 1" do
      items = select_days(Date.today, menu_item.course)
      expect(items.count).to eq(1)
    end

    it "count must be 0" do
      items = select_days(Date.yesterday, menu_item.course)
      expect(items.count).to eq(0)
    end

    it { expect(check_day(Date.today)).to be true}
    it { expect(check_day(Date.yesterday)).to be false}
  end
end
