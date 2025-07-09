class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :calculations, dependent: :destroy # 家計簿
  has_many :likes, dependent: :destroy # いいね
  has_many :liked_posts, through: :likes, source: :post # いいね
  has_many :comments, dependent: :destroy # コメント

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
end
