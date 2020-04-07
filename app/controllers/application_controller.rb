class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if resource.is_doctor
			root_path
		else
		end
	end

	  protected

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:is_doctor, :name])
	  end
end
