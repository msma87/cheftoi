class Service < ApplicationRecord
  # Relacionamentos
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  belongs_to :user
  has_one_attached :photo


  # Validações de title, category e price
  validates :title,
    presence: true,
    length: { maximum: 100, message: "não pode ter mais de 100 caracteres" },
    uniqueness: { case_sensitive: false, message: "já está em uso" }
  validates :category, presence: :true
  validates :price,
    presence: true,
    numericality: { greater_than: 0, less_than: 10_000, message: "deve ser maior que 0 e menor que 10.000" }


  # Callback para normalizar os títulos
  before_save :normalize_title

  def owned_by?(user)
    self.user == user
  end

  private

  def normalize_title
    self.title = title.titleize if title.present?
  end
end
