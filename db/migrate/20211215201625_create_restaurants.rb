class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.timestamps
      t.string :name, limit: 50, null: false
      t.text :address, null: false
    end
  end
end
