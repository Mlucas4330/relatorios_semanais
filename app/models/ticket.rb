class Ticket < ApplicationRecord
    validates :codigo, presence: true
    validates :descricao, presence: true
    validates :hora_inicio, presence: true
    validates :hora_fim, presence: true
    validates :dia_semana, presence: true
    validates :status, presence: true
end
