class ApiController < ApplicationController
    def search

    end

    def api_call(url)
        uri = URI(url)
        response = Net::HTTP.get_response(uri)
        json_response = JSON.parse(response.read_body)    
    end

    def results      
          
        @results = api_call("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_KEY']}&query=#{search_params}&page=1")["results"]
    end

    def movie_details
        @details = api_call("https://api.themoviedb.org/3/movie/#{movie_params}?api_key=#{ENV['TMDB_KEY']}&language=en-US")
        @crew = api_call("https://api.themoviedb.org/3/movie/#{movie_params}/credits?api_key=#{ENV['TMDB_KEY']}&language=en-US")
        @similar= api_call("https://api.themoviedb.org/3/movie/#{movie_params}/similar?api_key=#{ENV['TMDB_KEY']}&language=en-US")
        @genres = @details["genres"].map {|hash| hash["name"]}.join(", ")[0..-1]
        @synopsis = @details["overview"]
        @title = @details["title"]
        @rating = @details["vote_average"]
        @director = @crew["crew"].select{|e| e["job"] == "Director"}.map{|e|e["name"]}.join(", ")
        @cast = @crew["cast"]
        @release_date= @details["release_date"]
        @movie = Movie.find_by(title: @details["title"])
        @save_hash = {title: @title, genre: @genres, release_date: @release_date,
            rating: @rating, tmdb_id: movie_params, 
            img_url: "https://image.tmdb.org/t/p/original#{@details['poster_path']}", synopsis: @synopsis}
        @have_movie = @current_user.have_movie?(@movie)
    end


    private

    def search_params
        params.require(:search)
    end

    def movie_params
        params.require(:movie_id)
    end
end
