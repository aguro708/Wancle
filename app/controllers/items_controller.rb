class ItemsController < ApplicationController
	def index
		@items=Item.order("id DESC")
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
			render "posts/show"
		end
	end
	def favorite
    @all_ranks = Item.find(Favorite.group(:item_id).order('count(item_id) desc').pluck(:item_id))
    @genres=Genre.all
	end
	private
	def item_params
    params.require(:item).permit(:content,:image,:link)
end
end
