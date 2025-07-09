class Category < ApplicationRecord
    has_many :calculations, dependent: :restrict_with_exception
end
