require 'rails_helper'

describe Restaurant do
  it 'is valid with valid attributes' do
    res = Restaurant.new(name: 'Upland Brewing', address: '350 W 11th St, Bloomington, IN 47404')

    expect(res).to be_valid
  end

  it 'is invalid with an overly long name' do
    res = Restaurant.new(name: 'a' * 1000, address: '21 Jump Street, Beverly Hills, CA 90210')

    expect(res).not_to be_valid
  end

  it 'is invalid without an address' do
    res = Restaurant.new(name: 'Mr. Beast Burger')

    expect(res).not_to be_valid
  end

  it 'is invalid without a name' do
    res = Restaurant.new(address: '1234 Congress Ave, Austin, TX 78704')
    
    expect(res).not_to be_valid
  end
end
