class MoviesController < ApplicationController
    before_action :find_movie, only: [:show, :edit, :update]
    before_action :new_movie, only: [:new, :create]
    
    def show

    end

    def top_rated
    end

    def new

    end

    def create
        new_movie = Movie.find_or_create_by(import_movie)
        if new_movie.valid?
            flash[:movie_id] = new_movie.id
            redirect_to new_view_party_path
        else
            flash[:errors] = new_movie.errors.full_messages
        end

    end

    private

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
