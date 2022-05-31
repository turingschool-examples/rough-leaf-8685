# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all

warner_bros = Studio.create(name: 'Warner Brothers', location: 'Los Angeles')
  sheep = warner_bros.movies.create(title: "Sheep", creation_year: 2011,
    genre:"Horror")
  wolves = warner_bros.movies.create(title: "Wolves", creation_year: 2012,
    genre:"Horror")
  bear = warner_bros.movies.create(title: "Bear", creation_year: 2011,
    genre:"Drama")

lionsgate = Studio.create(name: 'Lionsgate', location: 'New York')
  the_game = lionsgate.movies.create(title: 'The Game', creation_year: 2015,
    genre: 'Drama')
  play_time = lionsgate.movies.create(title: 'Play Time', creation_year: 2012,
    genre: 'Horror')
  overtime = lionsgate.movies.create(title: 'Overtime', creation_year: 2013,
    genre: 'Mystery')

disney = Studio.create(name: 'Disney', location: 'Orlando')
  moana = disney.movies.create(title: 'Moana', creation_year: 2018,
     genre: 'Family')
  star_wars = disney.movies.create(title: 'Star Wars', creation_year: 2019,
     genre: 'Action')
  lion_king = disney.movies.create(title: 'Lion King', creation_year: 2002,
     genre: 'Family/Action')

daniel_radcliffe = Actor.create(name: "Daniel Radclifee", age:32)
heath_leger = Actor.create(name: "Heath Leger", age:38)
the_rock = Actor.create(name: "The Rock", age:42)
leonardo_dicaprio = Actor.create(name: "leonardo_dicaprio", age:40)
zoe_kravits = Actor.create(name: "Zoe Kravits", age:33)
ryan_jule = Actor.create(name: "Ryan Jule", age:36)
emma_lester = Actor.create(name: "Emma Lester", age:24)
ryan_gosling = Actor.create(name: "Ryan Gosling", age:44)
