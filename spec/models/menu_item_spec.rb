require 'rails_helper'

describe MenuItem do

  let(:restaurant) { Restaurant.new(name: 'Foobar', address: '756 Gerhold Stravenue, Suite 812, 13640, South Katrinaberg, Colorado, United States')  }
  let(:menu) { Menu.new(restaurant: restaurant, name: 'In-n-Out', menu_type: 'dinner') }
  let(:menu_item) { MenuItem.new(menus: [menu], name: 'Double-Double', price: 400) }
  
  it 'is valid with valid attributes' do
    expect(menu_item).to be_valid
  end

  it 'may not have a negative price' do
    menu_item.price = -100
    
    expect(menu_item).not_to be_valid
  end

  it 'may have a description' do
    menu_item.description = 'Burger with two patties, two slices of cheese, onions, tomatoes, lettuce, and our secret sauce'

    expect(menu_item).to be_valid
  end

  it 'is not highlighted by default' do
    expect(menu_item.highlighted).to be_falsey
  end

  describe 'MenuItem#price_s' do
    it 'can format dollar amounts correctly' do
      menu_item.price = 355

      expect(menu_item.price_s).to eq('$3.55')
    end
    
    it 'can format prices requiring one leading zero' do
      menu_item.price = 55

      expect(menu_item.price_s).to eq('$0.55')
    end

    it 'can format prices requiring two leading zeroes' do
      menu_item.price = 5

      expect(menu_item.price_s).to eq('$0.05')
    end

    it 'can format prices requiring one trailing zero' do
      menu_item.price = 150

      expect(menu_item.price_s).to eq('$1.50')
    end

    it 'can format prices requiring one leading and one trailing zero' do
      menu_item.price = 50

      expect(menu_item.price_s).to eq('$0.50')
    end
  end
end

