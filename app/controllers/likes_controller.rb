class LikesController < ApplicationController
	def create
		@post=Post.find(params[:post_id])
		@like=Like.new
		@like.user_id = current_user.id
		@like.post_id = @post.id
	    @like.save
	end
	def destroy
		@post=Post.find(params[:post_id])
		@like=Like.find_by(post_id: @post.id, user_id: current_user.id)
		@like.destroy
	end
end
