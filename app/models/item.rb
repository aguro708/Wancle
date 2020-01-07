class Item < ApplicationRecord
	attachment :image
	belongs_to :post
	belongs_to :user
end
