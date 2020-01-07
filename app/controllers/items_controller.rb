class ItemsController < ApplicationController

	def new
		@item=Item.new
	end
	def create
		@item=Item.new(item_params)
		@post=Post.find(params[:post_id])
		if @item.save
			redirect_to post_path(@post.id)
		else
			render :new
		end
	end
	def edit
		@item=Item.find(params[:id])
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
end
