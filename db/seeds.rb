require_relative './hero.rb'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserViewParty.destroy_all
ViewParty.destroy_all
Relationship.destroy_all
ServiceMovie.destroy_all
UserService.destroy_all
User.destroy_all
Movie.destroy_all
StreamingService.destroy_all

User.create(username: "Bob", password: "bob", name: "Bobby", location: "Boblandia", age: 30, bio: "Not very creative, enjoys bobbing for apples", img:"")
User.create(username: "Caryn", password: "mojo", name: "Caryn", location: "New York", age: 20, bio: "Flatiron Instructor", img:"")
#movie = Movie.create(title: "Midsummer", genre: "horror", rating: 10, release_date: "March, 12th, 2019", tmdb_id: 30, img_url: 'http://www.midsummer.com', synopsis: "Metaphorical horror movie")



ViewParty.create(name:"PARTY!!!", date:"March 14th,2020", movie_id: movie.id, streaming_location: "netflix")

Relationship.create(follower_id: User.first.id, followed_id: User.last.id)
Relationship.create(followed_id: User.first.id, follower_id: User.last.id)


UserMovie.create(user: User.first, movie: Movie.first, would_watch: true, seen_before: true, rating: 10, review: "Awesome movie")

UserViewParty.create(user: User.first, view_party: ViewParty.first)

ServiceMovie.create(streaming_service: StreamingService.first, movie: Movie.first)

StreamingService.create(name: "Netflix", streaming_url: "http://www.netflix.com", cost: 12.99, icon: 'netflixlogo.png')
StreamingService.create(name: "Youtube", streaming_url: "http://www.youtube.com", cost: 0, icon: 'youtubelogo.png')
StreamingService.create(name: "iTunes", streaming_url: "http://www.itunes.com", cost: 0, icon: 'ituneslogo.jpg')
StreamingService.create(name: "HBO Max", streaming_url: "http://www.hbomax.com", cost: 14.99, icon: 'hbologo.jpg')
StreamingService.create(name: "Amazon Instant Video", streaming_url: "http://www.primevideo.com", cost: 0, icon: 'amazonprime.jpg')
StreamingService.create(name: "Google Play", streaming_url: "http://www.googleplay.com", cost: 0, icon: 'googleplay.svg')
StreamingService.create(name: "Hulu", streaming_url: "http://www.hulu.com", cost: 0, icon: 'hululogo.png')
StreamingService.create(name: "Disney+", streaming_url: "http://www.disneyplus.com", cost: 9.99, icon: 'disneyplus.png')


UserService.create(user: User.first, streaming_service: StreamingService.first)
40.times do 
    Hero.get_hero(rand(1..731))

end

