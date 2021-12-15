require 'rails_helper'

describe Menu do
  
  let(:restaurant) { Restaurant.new(name: 'Foobar', address: '756 Gerhold Stravenue, Suite 812, 13640, South Katrinaberg, Colorado, United States')  }

  it 'is valid with valid attributes' do
    menu = Menu.new(restaurant: restaurant, name: "Bub's Burgers", menu_type: 'dinner')

    expect(menu).to be_valid
  end

  it 'is invalid with an overly long name' do
    menu = Menu.new(restaurant: restaurant, name: 'a' * 51, menu_type: 'breakfast')

    expect(menu).not_to be_valid
  end

  it 'is invalid without a type' do
    menu = Menu.new(restaurant: restaurant, name: 'Kurger Bing')

    expect(menu).not_to be_valid
  end

  it 'is invalid with a nonexistent type' do
    expect{Menu.new(restaurant: restaurant, name: 'Chez Panisse', menu_type: 'wallet_shredder')}.to raise_error(ArgumentError)
  end
end

