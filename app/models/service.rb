class Service < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments
  has_many :clients, through: :appointments
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0, less_than: 1440, only_integer: true }
end
