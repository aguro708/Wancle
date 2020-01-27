class Admins::ItemsController < ApplicationController
	skip_before_action :require_login
	def index
		@items=Item.order("id DESC").page(params[:page]).per(16)
		@genres=Genre.all
	end

	def edit
		@item=Item.find(params[:id])
	end

	def update
		@item=Item.find(params[:id])
		if @item.update(item_params)
			redirect_to admins_items_path
		else
			render :edit
		end
	end

	def destroy
		@item=Item.find(params[:id])
		@item.destroy
		redirect_to admins_items_path
	end

	def favorite
		@all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').pluck(:item_id))
		@all_ranks = Kaminari.paginate_array(@all_ranks).page(params[:page]).per(16)
		@genres=Genre.all
	end

	private
	def item_params
		params.require(:item).permit(:content,:image,:link)
	end

end
