class Product < ApplicationRecord
  has_many_attached :images

  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0, less_than: 200, message: 'must be between 0 and 200' }
end
