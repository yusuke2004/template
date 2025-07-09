class Dropdown < ApplicationRecord
    has_many :postdropdowns, dependent: :destroy
end
