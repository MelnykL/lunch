class CreateJoinTableOrdersAndMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_join_table :orders, :menu_items
  end
end
