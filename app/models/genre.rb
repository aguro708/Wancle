class Genre < ApplicationRecord
	has_many :posts,dependent: :destroy
	validates :genre, presence: true
end
