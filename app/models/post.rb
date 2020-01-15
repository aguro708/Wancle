class Post < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_many :items,dependent: :destroy
	has_many :likes,dependent: :destroy
	has_many :liked_users, through: :likes, source: :user
	validates :genre_id, presence: true
	validates :content, presence: true
	validates :content, length: {maximum:198}

	def self.search(search, post_or_item)
        if post_or_item=="1"
            Post.where(['content LIKE ?', "%#{search}%"])
        else
            Post.all
        end
    end
end
