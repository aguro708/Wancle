class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :require_login
	before_action :require_admin_login

    def after_sign_up_path_for(resource)
        flash[:notice]="successfully"
              posts_path
    end

    def after_sign_in_path_for(resource)
        flash[:notice]="successfully"
        if user_signed_in?
              posts_path
        else
        	admins_posts_path
        end
    end

    def after_sign_out_path_for(resource)
        flash[:notice]="successfully"
              root_path
    end

    def require_login
        unless current_user
        redirect_to new_user_session_path
        end
    end

    def require_admin_login
    	unless current_admin
    		redirect_to root_path
    	end
    end

    def require_admin_already
    	if current_admin
    		redirect_to admins_posts_path
    	end
    end

    def require_user_already
    	if current_user
    		redirect_to posts_path
    	end
    end

	def correct_user
		user=User.find(params[:id])
		if current_user!=user
			redirect_to user_path(id: current_user.id)
		end
	end

	def correct_post
		user=User.find(params[:user_id])
		if current_user!=user
			redirect_to posts_path
		end
	end

	def correct_item
		user=User.find(params[:user_id])
		if current_user!=user
			redirect_to items_path
		end
	end

	def configure_permitted_parameters
		added_attrs = [:name, :writer, :gender, :old]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end

end
