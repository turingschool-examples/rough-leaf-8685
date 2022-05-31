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
  sheep = warner_bros.movies.creat(title: "Sheep", creation_year: 2011,
    genre:"Horror")
  wolves = warner_bros.movies.creat(title: "Wolves", creation_year: 2012,
    genre:"Horror")
  bear = warner_bros.movies.creat(title: "Bear", creation_year: 2011,
    genre:"Drama")

lionsgate = Studio.create(name: 'Lionsgate', location: 'New York')
  the_game = disney.movies.create(title: 'The Game', creation_year: 2015,
    genre: 'Drama')
  play_time = disney.movies.create(title: 'Play Time', creation_year: 2012,
    genre: 'Horror')
  overtime = disney.movies.create(title: 'Overtime', creation_year: 2013,
    genre: 'Mystery')

disney = Studio.create(name: 'Disney', location: 'Orlando')
  moana = disney.movies.create(title: 'Moana', creation_year: 2018,
     genre: 'Family')
  star_wars = disney.movies.create(title: 'Star Wars', creation_year: 2019,
     genre: 'Action')
  lion_king = disney.movies.create(title: 'Lion King', creation_year: 2002,
     genre: 'Family/Action')

daniel_radcliffe
