FactoryBot.define do
  factory :cart do
    menu_items { [association(:menu_item)] }
  end
end