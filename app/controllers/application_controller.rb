class ApplicationController < ActionController::Base
    before_action :logged_in?

    def logged_in?
        @current_user = User.find_by(id: session[:user_id])
    end

    def authorized
        redirect_to new_login_path unless logged_in?
    end

end