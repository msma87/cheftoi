class User < ApplicationRecord
  # Relacionamentos
  has_many :bookings, dependent: :destroy
  has_many :services, dependent: :destroy  # serviços que o usuário oferece
  has_many :booked_services, through: :bookings, source: :service  # serviços que o usuário reservou

  # Validações
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "não é válido" }
  validates :email, uniqueness: { case_sensitive: false, message: "já está em uso" }
  validates :password, length: { minimum: 6 }, if: -> { encrypted_password.blank? || !password.nil? }

  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
