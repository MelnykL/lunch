class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.date :day
      t.integer :course

      t.timestamps
    end
  end
end
