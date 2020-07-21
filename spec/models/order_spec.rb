require 'rails_helper'

RSpec.describe Order, type: :model do

  context 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_and_belong_to_many(:menu_items).class_name('MenuItem') }
  end
end
