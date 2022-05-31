# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

movie_1 = studio_1.movies.create!(title: "Cool Movie", creation_year: 1986, genre: "Superhero")

actor_1 = Actor.create!(name: "Billy Bob Thorton", age: 69)
actor_2 = Actor.create!(name: "Allison Brie", age: 44)
actor_3 = Actor.create!(name: "John Belushi", age: 22)

act_movie_1 = ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
act_movie_2 = ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
