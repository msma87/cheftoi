class Booking < ApplicationRecord
  # Relacionamentos 
  belongs_to :user
  belongs_to :service

  # Validações de presença
  validates :date, presence: { message: "não pode ficar em branco" }
  validates :user, presence: { message: "não pode ficar em branco" }
  validates :service, presence: { message: "não pode ficar em branco" }

  # Validação de unicidade: garante que o mesmo usuário não reserve o mesmo serviço na mesma data
  validates :service_id, uniqueness: { scope: [:user_id, :date], message: "já foi reservado para este usuário nesta data" }
end
