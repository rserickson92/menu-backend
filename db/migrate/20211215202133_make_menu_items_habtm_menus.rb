class MakeMenuItemsHabtmMenus < ActiveRecord::Migration[6.1]
  def change
    create_join_table :menus, :menu_items
    remove_belongs_to :menu_items, :menu, null: false, foreign_key: true
    add_index :menu_items, :name, unique: true
  end
end
