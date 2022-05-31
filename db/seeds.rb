# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
universal = Studio.create!(name: "Universal", location: "Hollywood")
warner_bros = Studio.create!(name: "Warner Brothers", location: "Los Angeles")
columbia = Studio.create!(name: "Columbia Pictures", location: "San Francisco")

raiders = universal.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure")
indiana = universal.movies.create!(title: "Indiana Jones", creation_year: 1979, genre: "Action/Adventure")
jurassic = warner_bros.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-Fi")
true_romance = warner_bros.movies.create!(title: "True Romance", creation_year: 1995, genre: "Romance")
big_lebowski = columbia.movies.create!(title: "The Big Lebowski", creation_year: 1998, genre: "Comedy")
man_on_fire = columbia.movies.create!(title: "Man On Fire", creation_year: 2006, genre: "Action/Adventure")

harrison = Actor.create!(name: "Harrison Ford", age: 78)
latifah = Actor.create!(name: "Queen Latifah", age: 60)
jeff = Actor.create!(name: "Jeff Bridges", age: 65)
sam = Actor.create!(name: "Sam Neill", age: 70)
laura = Actor.create!(name: "Laura Dern", age: 55)
denzel = Actor.create!(name: "Denzel Washington", age: 57)
lucy = Actor.create!(name: "Lucy Liu", age: 46)

MovieActor.create!(movie: raiders, actor: harrison)
MovieActor.create!(movie: raiders, actor: latifah)
MovieActor.create!(movie: true_romance, actor: harrison)
MovieActor.create!(movie: big_lebowski, actor: jeff)
MovieActor.create!(movie: jurassic, actor: sam)
MovieActor.create!(movie: jurassic, actor: laura)
MovieActor.create!(movie: man_on_fire, actor: denzel)
