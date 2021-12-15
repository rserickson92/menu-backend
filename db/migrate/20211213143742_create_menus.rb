class CreateMenus < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE t_menu_type AS ENUM ('breakfast', 'lunch', 'dinner', 'beverage', 'brunch', 'special');
    SQL

    create_table :menus do |t|
      t.timestamps
      t.string :name, limit: 50, null: false
      t.column :type, :t_menu_type, null: false
    end
  end

  def down
    drop_table :menus

    execute <<-SQL
      DROP TYPE t_menu_type;
    SQL
  end
end

