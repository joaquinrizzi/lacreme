class User < ApplicationRecord
  has_many :appointments
  has_many :services, through: :appointments
  has_many :created_services, class_name: 'Service', foreign_key: 'creator_id'

  # Define roles
  ROLES = %w[admin user guest].freeze

  # Ensure role is present and valid
  validates :role, presence: true, inclusion: { in: ROLES }

  # Method to check if user has a specific role
  def has_role?(role)
    self.role == role.to_s
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
