class UsersController < ApplicationController
	def show
		@user=User.find(params[:id])
	end
	def edit
		@user=User.find(params[:id])
	end
	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id)
		else
			render :show
		end
	end
	def destroy
		@user=User.find(params[:id])
		if @user.destroy
			redirect_to root_path
		else
			render :show
		end
	end
	private
	def user_params
		params.require(:user).permit(:name,:old,:gender,:profile_image,:introduction,:writer)
	end
end
