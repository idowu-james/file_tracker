class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :password , :registry_officer, :office_id ,[office_attributes: [:name]]) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :password, :current_password, :office_id ,[office_attributes: [:name]]) }
        end

        devise_group :person, contains: [:user, :admin]
         before_filter :authenticate_person! # Ensure someone is logged in
        
        def after_sign_in_path_for(resource)
         # check for the class of the object to determine what type it is
          if resource.class == User
            root_path
          elsif resource.class == Admin
            users_path
          end 
        end

        def after_sign_out_path_for(resource_or_scope)
          new_user_session_path
        end

    private

    def reg_officer_admin
      unless (current_user && current_user.registry_officer?) || current_admin
            redirect_to root_path, notice: "You Need to log in as a Registry officer or Admin to perform this function"
      end
    end
    	def registry_officer
   			unless current_user && current_user.registry_officer?
      			redirect_to :back, notice: "You Need to log in as a Registry officer to perform this function"
      		end
  		end

      def admin
        unless current_admin
            redirect_to :back, notice: "You Need to log in as an admin to perform this function"
          end
      end
end
