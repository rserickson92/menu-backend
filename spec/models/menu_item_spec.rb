describe MenuItem do

  let (:menu) { double(:menu) }
  let (:menu_item) { MenuItem.new(menu: menu, name: 'Double-Double', price: 400) }
  
  it 'is valid with valid attributes' do
    expect(menu_item).to be_valid
  end

  it 'is invalid when not part of a menu' do
    menu_item.menu = null

    expect(menu_item).not_to be_valid
  end

  it 'may have a description' do
    menu_item.description = 'Burger with two patties, two slices of cheese, onions, tomatoes, lettuce, and our secret sauce'

    expect(menu_item).to be_valid
  end

  it 'is not highlighted by default' do
    expect(menu_item.highlighted).to be_falsey
  end
end

