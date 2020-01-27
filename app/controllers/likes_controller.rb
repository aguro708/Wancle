class LikesController < ApplicationController
	skip_before_action :require_admin_login

	def index
		@likes=Like.where(user_id: current_user.id).order("id DESC").page(params[:page]).per(15)
	end

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
