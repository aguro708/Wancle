class UsersController < ApplicationController
	def show
		@user=User.find(params[:id])
		@posts=@user.posts.order("id DESC")
		@items=@user.items.order("id DESC")
	end
	def edit
		@user=User.find(params[:id])
	end
	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id)
		else
			@posts=@user.posts.order("id DESC")
			@items=@user.items.order("id DESC")
			render :show
		end
	end
	def destroy
		@user=User.find(params[:id])
		if @user.destroy
			redirect_to root_path
		else
			@posts=@user.posts.order("id DESC")
			@items=@user.items.order("id DESC")
			render :show
		end
	end
	private
	def user_params
		params.require(:user).permit(:name,:old,:gender,:profile_image,:introduction,:writer)
	end
end
