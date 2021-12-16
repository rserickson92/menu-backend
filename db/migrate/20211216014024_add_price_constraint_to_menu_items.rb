class AddPriceConstraintToMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_check_constraint :menu_items, 'price >= 0'
  end
end
