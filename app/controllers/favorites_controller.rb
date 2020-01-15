class FavoritesController < ApplicationController
	def index
		@favorites=Favorite.where(user_id: current_user.id).order("id DESC").page(params[:page]).per(16)
	end
	def create
		@item=Item.find(params[:item_id])
		@favorite=Favorite.new
		@favorite.user_id=current_user.id
		@favorite.item_id=@item.id
		@favorite.save
	end

	def destroy
		@item=Item.find(params[:item_id])
		@favorite=Favorite.find_by(item_id: @item.id,user_id: current_user.id)
		@favorite.destroy
	end
end
