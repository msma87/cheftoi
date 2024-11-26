class User < ApplicationRecord
  # Relacionamentos
  has_many :bookings, dependent: :destroy
  has_many :services, through: :bookings

  # Validações
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "não é válido" }
  validates :email, uniqueness: { case_sensitive: false, message: "já está em uso" }
  validates :password, length: { minimum: 6 }, if: -> { encrypted_password.blank? || !password.nil? }

  # Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  
end
