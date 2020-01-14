class Item < ApplicationRecord
	attachment :image
	belongs_to :post
	belongs_to :user
	has_many :favorites,dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	validates :link, presence: true
	validates :content, presence: true
	validates :content, length: {maximum:100}

	def self.search(search, post_or_item)
        if post_or_item=="2"
            Item.where(['content LIKE ?', "%#{search}%"])
        else
            Item.all
        end
    end
end
