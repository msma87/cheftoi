class Service < ApplicationRecord
  # Relacionamentos
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  belongs_to :user
  has_one_attached :photo


  # Validações de title, category e price
  validates :title,
    presence: true,
    length: { maximum: 100, message: "Máximo 100 caracteres" },
    uniqueness: { case_sensitive: false, message: "Título já em uso" }
  validates :category, presence: :true
  validates :description, presence: :true
  validates :price,
    presence: true,
    numericality: { greater_than: 0, message: "Deve ser maior que zero"}


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
