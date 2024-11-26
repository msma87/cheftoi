class Service < ApplicationRecord
  # incluindo relações - Máira
  belongs_to :user
  has_many :bookings
 # incluindo validações - Máira
  validates :title, presence: true
  validates :price, presence: true
end
