class CreateMenus < ActiveRecord::Migration[6.1]
  def up
    create_table :menus do |t|
      t.timestamps
      t.string :name, limit: 50, null: false
      t.column :type, :t_menu_type, null: false
    end

    execute <<-SQL
      CREATE TYPE t_menu_type AS ENUM ('breakfast', 'lunch', 'dinner', 'beverage', 'brunch', 'special');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE t_menu_type;
    SQL

    drop_table :menus
  end
end

