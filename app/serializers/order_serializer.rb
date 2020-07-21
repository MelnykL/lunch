class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :total_price, :user, :menu_items
end
