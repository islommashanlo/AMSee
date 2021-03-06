class MoviesController < ApplicationController
    before_action :find_movie, only: [:show, :edit, :update]
    before_action :new_movie, only: [:new, :create]
    
    def show

    end

    def top_rated
    end

    def index
        @movies = @current_user.movies
    end
    def new

    end

    def create
        new_movie = Movie.find_or_create_by(import_movie)
        new_movie.streaming_api(new_movie.tmdb_id)
        if new_movie.valid?
            new_relation = UserMovie.find_by(user_id: @current_user.id, movie_id: new_movie.id)
            if !new_relation
                new_relation = UserMovie.create(user_id: @current_user.id, movie_id: new_movie.id, rating: 0.01)
            end
            flash[:movie_id] = new_movie.id
            flash[:user_movie] = new_relation.id
            redirect_to new_view_party_path
        else
            flash[:errors] = new_movie.errors.full_messages
        end

    end

    private

    def user_movie_params
        
    end
    def import_movie
        params.require(:info).permit(:title, :genre, :release_date, :rating, :tmdb_id, :img_url, :synopsis)
    end

    def movie_params
        params.require(:movie).permit(:title, :genre, :rating, :tmdb_id, :img_url, :synopsis)
    end

    def find_movie 
        @movie = Movie.find_by(params[:id])
    end

    def new_movie
        @movie = Movie.new
    end
end
