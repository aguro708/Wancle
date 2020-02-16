class ItemsController < ApplicationController
	skip_before_action :require_login, only: [:index,:favorite]
	skip_before_action :require_admin_login
	before_action :require_admin_already, only: [:index,:favorite]
	before_action :correct_item,only: [:edit]

	def index
		@items=Item.order("id DESC").page(params[:page]).per(16)
		@genres=Genre.all
	end

	def new
		@item=Item.new
		@post=Post.find(params[:post_id])
	end

	def create
		@item=Item.new(item_params)
		@post=Post.find(params[:post_id])
		@item.post_id=@post.id
		@item.user_id=current_user.id
		if @item.save
			redirect_to post_path(@post.id)
		else
			render :new
		end
	end

	def edit
		@item=Item.find(params[:id])
		@post=Post.find(params[:post_id])
		@user=User.find(params[:user_id])
		unless @user==@item.user
			redirect_to items_path
		end
	end

	def update
		@item=Item.find(params[:id])
		@post=Post.find(params[:post_id])
		if @item.update(item_params)
			redirect_to post_path(@post.id)
		else
			render :edit
		end
	end

	def destroy
		@item=Item.find(params[:id])
		@post=Post.find(params[:post_id])
		if @item.destroy
			redirect_to post_path(@post.id)
		else
			@items=@post.items.page(params[:page]).per(16)
			render "posts/show"
		end
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
