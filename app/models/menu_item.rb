class MenuItem < ApplicationRecord
  belongs_to :menu

  validates :name, presence: true, length: { maximum: 50 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def price_s
    str = price.to_s
    decimal_index = str.length == 1 ? 0 : -3
    str.insert(decimal_index, '.')
    str.insert(0, '$')
  end
end

