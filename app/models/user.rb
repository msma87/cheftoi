class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_many :services, dependent: :destroy
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # incluido relações - Máira
  has_many :services
  has_many :bookings
end
