class Restaurant < ApplicationRecord
  has_many :menus

  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true
end
