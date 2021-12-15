class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.timestamps
      t.belongs_to :menu, null: false, foreign_key: true
      t.string :name, limit: 50, null: false
      t.integer :price, null: false
      t.text :description
      t.boolean :highlighted, null: false, default: false
    end
  end
end

