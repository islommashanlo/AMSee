# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  title        :string
#  genre        :string
#  release_date :datetime
#  rating       :float
#  tmdb_id      :integer
#  img_url      :string
#  synopsis     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Movie < ApplicationRecord
    has_many :user_movies
    has_many :users, through: :user_movies, dependent: :destroy
    has_many :service_movies
    has_many :streaming_services, through: :service_movies, dependent: :destroy
    has_many :view_parties, dependent: :destroy



    def average_rating
        if self.user_movies.count > 0
            self.user_movies.sum{|m|m.rating} / self.user_movies.count
        else 
            0
        end
    end

    def self.max_rating
        if self.all.count > 0
            self.all.max(5){|e|e.average_rating}
        else
        end
    end

    def streaming_api
        url = URI("https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com/idlookup?country=us&source_id=#{self.tmdb_id}&source=tmdb")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = ENV['UTELLY_HOST']
        request["x-rapidapi-key"] = ENV['UTELLY_KEY']
        response = http.request(request)
        info = JSON.parse(response.read_body)
        streaming_locations = info["collection"]["locations"]
        create_relations(streaming_locations)
    end


    def create_relations(location_list)
        if location_list.length > 0
            location_list.each do |location|
                location_find(location)
            end
        end
    end
    
    def location_find(location)
        found = StreamingService.find_by(name: location["display_name"])
        if found
            ServiceMovie.find_or_create_by(movie: self, streaming_service: found, stream_location: location["url"] )
        end
    end
        

    
end
