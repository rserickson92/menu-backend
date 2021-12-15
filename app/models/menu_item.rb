class MenuItem < ApplicationRecord
  has_and_belongs_to_many :menus

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def price_s
    str = price.to_s
    if str.length == 1
      str.insert(0, '$0.0')
    elsif str.length == 2
      str.insert(-3, '.')
      str.insert(0, '$0')
    else
      str.insert(-3, '.')
      str.insert(0, '$')
    end

    str
  end
end

