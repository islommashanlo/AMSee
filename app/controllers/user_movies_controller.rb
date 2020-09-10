class UserMoviesController < ApplicationController

    before_action :new_user_movie, only: [:new, :create]
    before_action :find_user_movie, only: [:show, :update, :edit]
    
    def index
        @user_movies = UserMovie.all
    end

    def new
        
    end

    def edit
        @user_movie=UserMovie.find(params[:id])
    end

    def update
        @user_movie.update(user_movie_params)
        if @user_movie.valid?
            redirect_to user_path(@current_user)
        else
            flash[:errors] = @user_movie.errors.full_messages
        end
    end
    
    def create
        byebug
        @user_movie.update(user_movie_params)
        if @user_movie.valid?
            redirect_to user_path(@current_user)
        else
            flash[:errors] = @user_movie.errors.full_messages
            redirect_to user_path(@current_user)
        end
    end
    
    

    private

    def user_movie_params
        params.require(:user_movie).permit(:would_watch, :seen_before, :rating, :review, :movie_id, :user_id)
    end

    def new_user_movie
        @user_movie = UserMovie.new(params[:id])
    end

    def find_user_movie
        @user_movie = UserMovie.find(params[:id])
    end
    
end
