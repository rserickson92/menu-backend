class Menu < ApplicationRecord
  enum menu_type: %i(breakfast lunch dinner beverage brunch special).map{ |sym| [sym, sym.to_s] }.to_h

  has_many :menu_items

  validates :name, presence: true, length: { maximum: 50 }
  validates :menu_type, presence: true
end
