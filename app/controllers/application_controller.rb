class ApplicationController < ActionController::Base

    def after_sign_up_path_for(resource)
        flash[:notice]="successfully"
              posts_path
    end
    def after_sign_in_path_for(resource)
        flash[:notice]="successfully"
              posts_path
    end
    def after_sign_out_path_for(resource)
        flash[:notice]="successfully"
              root_path
    end
	def configure_permitted_parameters
		added_attrs = [ :name, :writer, :gender, :old ]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    end
end
