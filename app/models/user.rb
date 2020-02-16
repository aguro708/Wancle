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
  has_many :active_relationships, class_name:  "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  validates :name, presence: true
  validates :name, length: {maximum:20}
  validates :gender, presence: true
  validates :writer, presence: true
  validates :old, presence: true
  validates :old, numericality: {only_integer: true}
  validates :old, numericality: {greater_than_or_equal_to: 0}
  validates :introduction, length: {maximum:100}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,format: { with: VALID_EMAIL_REGEX }

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  def already_favorited?(item)
    self.favorites.exists?(item_id: item.id)
  end

end
