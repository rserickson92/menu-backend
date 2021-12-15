require 'rails_helper'

describe MenuItem do

  let(:restaurant) { Restaurant.new(name: 'Foobar', address: '756 Gerhold Stravenue, Suite 812, 13640, South Katrinaberg, Colorado, United States')  }
  let(:menu) { Menu.new(restaurant: restaurant, name: 'In-n-Out', menu_type: 'dinner') }
  let(:menu_item) { MenuItem.new(menus: [menu], name: 'Double-Double', price: 400) }
  
  it 'is valid with valid attributes' do
    expect(menu_item).to be_valid
  end

  it 'may have a description' do
    menu_item.description = 'Burger with two patties, two slices of cheese, onions, tomatoes, lettuce, and our secret sauce'

    expect(menu_item).to be_valid
  end

  it 'is not highlighted by default' do
    expect(menu_item.highlighted).to be_falsey
  end
end

