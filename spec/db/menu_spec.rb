require 'rails_helper'

describe 'example menus' do

  describe 'breakfast menu' do
    before(:all) do
      res = Restaurant.create(name: 'Stacks', address: '139 E Campbell Ave, Campbell, CA 95008')
      @menu = Menu.create(restaurant: res, name: "Stacks Breakfast Fixin's", menu_type: 'breakfast')
      @menu.menu_items.create(name: 'Oreo Pancake Short Stack', price: 500)
      @menu.menu_items.create(name: 'Oreo Pancake Full Stack', price: 600, highlighted: true)
      @menu.menu_items.create(name: 'Denver Omelette', price: 700, highlighted: true)
      @menu.menu_items.create(name: 'Biscuits & Gravy', price: 350)
      @menu.menu_items.create(name: 'Coffee', price: 100)
      @menu.menu_items.create(name: 'Bacon Slices (2)', price: 75)
    end

    it 'has all items accessible from the menu' do
      expect(@menu.menu_items.size).to eq(6)
    end

    it 'has the menu accessible from the item' do
      item = MenuItem.find_by(name: 'Biscuits & Gravy')

      expect(item.menus.first).to eq(@menu)
    end

    it 'has highlights' do
      expect(@menu.menu_items.where(highlighted: true)).not_to be_empty
    end

    it 'can be sorted by price' do
      expected_result = [
        ['Bacon Slices (2)', 75],
        ['Coffee', 100],
        ['Biscuits & Gravy', 350],
        ['Oreo Pancake Short Stack', 500],
        ['Oreo Pancake Full Stack', 600],
        ['Denver Omelette', 700],
      ]
      
      expect(@menu.menu_items.order(:price).pluck(:name, :price)).to eq(expected_result)
    end

    it 'can be sorted alphabetically' do
      expected_result = [
        'Bacon Slices (2)',
        'Biscuits & Gravy',
        'Coffee',
        'Denver Omelette',
        'Oreo Pancake Full Stack',
        'Oreo Pancake Short Stack',
      ]

      expect(@menu.menu_items.order(:name).pluck(:name)).to eq(expected_result)
    end
  end

  describe 'brunch restaurant with multiple menus with shared items'
end

