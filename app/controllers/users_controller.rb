class UsersController < ApplicationController
	skip_before_action :require_admin_login
	before_action :correct_user,only:[:edit]
	def show
		@user=User.find(params[:id])
		@posts=@user.posts.order("id DESC").page(params[:post_page]).per(10)
		@items=@user.items.order("id DESC").page(params[:item_page]).per(16)
	end

	def edit
		@user=User.find(params[:id])
	end

	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	def destroy
		@user=User.find(params[:id])
		if @user.destroy
			redirect_to root_path
		else
			@posts=@user.posts.order("id DESC").page(params[:post_page]).per(10)
			@items=@user.items.order("id DESC").page(params[:item_page]).per(16)
			render :show
		end
	end

	private
	def user_params
		params.require(:user).permit(:name,:old,:gender,:profile_image,:introduction,:writer)
	end

end
