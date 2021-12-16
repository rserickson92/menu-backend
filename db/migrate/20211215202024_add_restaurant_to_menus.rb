class AddRestaurantToMenus < ActiveRecord::Migration[6.1]
  def change
    add_belongs_to :menus, :restaurant, null: false, foreign_key: true
  end
end
