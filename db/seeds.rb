# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Movie.destroy_all
StreamingService.destroy_all
ViewParty.destroy_all
Friend.destroy_all


User.create(username: "Bob", password: "bob", name: "Bobby", location: "Boblandia", age: 30, bio: "Not very creative, enjoys bobbing for apples")
User.create(username: "Caryn", password: "mojo", name: "Caryn", location: "New York", age: 20, bio: "Flatiron Instructor")

movie = Movie.create(title: "Midsummer", genre: "horror", rating: 10, release_date: "March, 12th, 2019", tmdb_id: 30, img_url: 'http://www.midsummer.com', synopsis: "Metaphorical horror movie")

StreamingService.create(name: "Netflix", streaming_url: "www.netflix.com", cost: 12.99)

ViewParty.create(name:"PARTY!!!", date:"March 14th,2020", movie_id: movie.id, streaming_location: "netflix")

# Friend.create(user: User.first, friend: User.last)

UserMovie.create(user: User.first, movie: Movie.first, would_watch: true, seen_before: true, rating: 10, review: "Awesome movie")

UserViewParty.create(user: User.first, view_party: ViewParty.first)

ServiceMovie.create(streaming_service: StreamingService.first, movie: Movie.first)

UserService.create(user: User.first, streaming_service: StreamingService.first)