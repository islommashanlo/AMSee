class UsersController < ApplicationController
    before_action :new_user, only: [:new, :create]
    before_action :find_user, only: [:show, :update, :edit]
    
    def new
    end
    
    def index
        if @current_user
            @users = User.where.not(id: @current_user.id)
        else
            @users = User.all
        end
    end
    def show
        
    end

    def create
        @user.update(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation, :name, :location, :age, :bio)
    end

    def new_user
        @user = User.new
    end

    def find_user
        @user = User.find(params[:id])
    end
    
end
