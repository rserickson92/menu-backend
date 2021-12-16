require 'rails_helper'

describe 'brunch joint' do
  before(:all) do
    @res = Restaurant.create(name: 'Cloverleaf South', address: '325 E Winslow Rd, Bloomington, IN 47401')

    @breakfast_menu = @res.menus.create(name: 'Breakfast (5:00am-11:00am M-F)', menu_type: 'breakfast')
    @breakfast_menu.menu_items.create(name: 'Pancake Short Stack', price: 300)
    @breakfast_menu.menu_items.create(name: 'Pancake Full Stack', price: 400)
    @breakfast_menu.menu_items.create(name: 'Eggs Benedict', price: 700, highlighted: true)
    @breakfast_menu.menu_items.create(name: 'Country Fried Steak & Eggs', price: 900, highlighted: true)
    @breakfast_menu.menu_items.create(name: 'Biscuits & Gravy', price: 350)
    @breakfast_menu.menu_items.create(name: 'Coffee', price: 100)
    @breakfast_menu.menu_items.create(name: 'Bacon Slices (2)', price: 75)

    @lunch_menu = @res.menus.create(name: 'Lunch (11:00am-2:00pm M-F)', menu_type: 'lunch')
    @lunch_menu.menu_items.create(name: 'Turkey Club', price: 500)
    @lunch_menu.menu_items.create(name: 'Caesar Salad', price: 500, highlighted: true)
    @lunch_menu.menu_items.create(name: 'Double Cheeseburger', price: 650, highlighted: true)
    @lunch_menu.menu_items.create(name: 'Pork Tenderloin', price: 800, highlighted: true)
    @lunch_menu.menu_items.create(name: 'French Fries', price: 425)
    @lunch_menu.menu_items.create(name: 'Coca-Cola', price: 100)
    @lunch_menu.menu_items.create(name: 'Side of Ranch', price: 10)

    @brunch_menu = @res.menus.create(name: 'Brunch (8:00am-2:00pm Weekends)', menu_type: 'brunch')
    @brunch_menu.menu_items = @breakfast_menu.menu_items + @lunch_menu.menu_items
  end

  it 'has a breakfast menu' do
    expect(@res.menus.find_by(menu_type: 'breakfast')).to eq(@breakfast_menu)
  end

  it 'has a lunch menu' do
    expect(@res.menus.find_by(menu_type: 'lunch')).to eq(@lunch_menu)
  end

  it 'has a brunch menu' do
    expect(@res.menus.find_by(menu_type: 'brunch')).to eq(@brunch_menu)
  end

  it 'has a brunch menu containing all items from both menus with no duplicates' do
    breakfast_item_names = Set.new(@breakfast_menu.menu_items.pluck(:name))
    lunch_item_names = Set.new(@lunch_menu.menu_items.pluck(:name))

    expect(breakfast_item_names.size + lunch_item_names.size).to eq(@brunch_menu.menu_items.size)
   
    brunch_item_names = Set.new(@brunch_menu.menu_items.pluck(:name))
    expect(breakfast_item_names + lunch_item_names).to eq(brunch_item_names)
  end
end

