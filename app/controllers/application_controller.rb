class ApplicationController < ActionController::Base
    before_action :logged_in?

    def logged_in?
        @current_user = User.find_by(id: session[:user_id])
    end

    def authorized
        unless logged_in?
            flash[:errors] = "You Need To Be Logged In"
            redirect_to new_login_path
        end 
    end

end
