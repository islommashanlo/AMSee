require 'open-uri'
class Hero

    def self.get_hero(num)
        
        url = "https://superheroapi.com/api/#{ENV['HERO_KEY']}/#{num}"
        uri = URI(url)
        response = open(uri)
        @trial = JSON.parse(response.read)
        
        params = {
        username: @trial["name"],
        name: @trial["biography"]["full-name"],
        location: @trial["biography"]["place-of-birth"],
        bio: @trial["work"]["occupation"],
        age: @trial["powerstats"]["speed"].to_i,
        img: @trial["image"]["url"],
        password: "123"}
        User.create(params)
    end

     
end
