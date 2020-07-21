class CreateJoinTableCartMenuItem < ActiveRecord::Migration[6.0]
  def change
    create_join_table :carts, :menu_items
  end
end
