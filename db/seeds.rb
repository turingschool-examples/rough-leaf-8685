# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MovieActor.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all

studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
studio2 = Studio.create!(name: 'Pixar', location: 'Emeryville')
movie1 = studio1.movies.create!(name: 'Tomato', creation_year: 1992)
movie2 = studio1.movies.create!(name: 'Potato', creation_year: 1993)
movie3 = studio2.movies.create!(name: 'Pinapple', creation_year: 1994)
movie4 = studio2.movies.create!(name: 'Coconut', creation_year: 1995)
actor1 = Actor.create!(name: 'Apple', age: 27)
actor2 = Actor.create!(name: 'Kiwi', age: 43)
actor3 = Actor.create!(name: 'Strawberry', age: 31)
actor4 = Actor.create!(name: 'Blueberry', age: 29)
MovieActor.create!(movie: movie1, actor: actor1)
MovieActor.create!(movie: movie1, actor: actor2)
MovieActor.create!(movie: movie2, actor: actor3)
MovieActor.create!(movie: movie3, actor: actor1)
