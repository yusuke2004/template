class Calculation < ApplicationRecord
    belongs_to :user
    belongs_to :category, optional: true

    validates :date, :amount, :calculation_type, presence: true
end
