class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :posts,dependent: :destroy
         has_many :items,dependent: :destroy
         attachment :profile_image
         has_many :likes, dependent: :destroy
         has_many :liked_posts, through: :likes, source: :post
         has_many :favorites, dependent: :destroy
         has_many :favorited_items, through: :favorites, source: :item

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  def already_favorited?(item)
    self.favorites.exists?(item_id: item.id)
  end

end
