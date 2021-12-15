require 'rails_helper'

describe Menu do
  it 'is valid with valid attributes' do
    menu = Menu.new(name: "Bub's Burgers", type: 'dinner')

    expect(menu).to be_valid
  end

  it 'is invalid with an overly long name' do
    menu = Menu.new(name: 'a' * 51, type: 'breakfast')

    expect(menu).not_to be_valid
  end

  it 'is invalid without a type' do
    menu = Menu.new(name: 'Kurger Bing')

    expect(menu).not_to be_valid
  end

  it 'is invalid with a nonexistent type' do
    expect{Menu.new(name: 'Chez Panisse', type: 'wallet_shredder')}.to raise_error(ArgumentError)
  end
end

