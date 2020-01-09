class Post < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_many :items,dependent: :destroy
	has_many :likes
	has_many :liked_users, through: :likes, source: :user
end
