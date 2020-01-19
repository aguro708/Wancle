class RelationshipsController < ApplicationController
	skip_before_action :require_admin_login

	def create
		@user = User.find(params[:followed_id])
		current_user.follow(@user)

	end

	def destroy
		@user = Relationship.find(params[:id]).followed
	    current_user.unfollow(@user)
	end

  def following
    @user  = User.find(params[:user_id])
    @users = @user.following.order("id DESC").page(params[:page]).per(50)
  end

  def follower
    @user  = User.find(params[:user_id])
    @users = @user.followers.order("id DESC").page(params[:page]).per(50)
  end
end
