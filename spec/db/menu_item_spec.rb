require 'rails_helper'

describe 'MenuItem' do
  before(:all) do
    res = Restaurant.create(name: 'Franklin Barbecue', address: '900 E 11th St, Austin, TX 78702')
    @menu = res.menus.create(name: 'Main Menu', menu_type: 'lunch')
    @menu.menu_items.create(name: 'Brisket (1lb)', price: 2000)
  end

  it 'does not allow duplicate names' do
    @menu.menu_items.create(name: 'Brisket (1lb)', price: 2000)

    expect(@menu).not_to be_valid
  end
end

