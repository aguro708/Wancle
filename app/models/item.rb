class Item < ApplicationRecord
	attachment :image
	belongs_to :post
	belongs_to :user
	has_many :favorites
	has_many :favorited_users, through: :favorites, source: :user
end
