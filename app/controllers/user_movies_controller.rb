class UserMoviesController < ApplicationController

    before_action :new_user_movie, only: [:new, :create]
    before_action :find_user_movie, only: [:show, :update, :edit]
    
    def index
        @user_movies = UserMovie.all
    end

    def new
        
    end

    def edit

    end

    def create
        
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
