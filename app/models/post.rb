class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    has_many :likes, dependent: :destroy # いいね
    has_many :liked_users, through: :likes, source: :user # いいね
    has_many :comments, dependent: :destroy # コメント
end
