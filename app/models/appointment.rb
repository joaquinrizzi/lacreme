class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :client
end
