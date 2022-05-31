# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  #movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  #Character.create(name: 'Luke', movie: movies.first)

@studio_1 = Studio.create!(name: 'Paramount', location: "Hollywoo")
@studio_2 = Studio.create!(name: 'Pixar', location: "Orlando")
@sw = @studio_1.movies.create!(title: "Star Wars", creation_year: 1984, genre: "Sci-fi" )
@lotr = @studio_1.movies.create!(title: "Lord of the Rings", creation_year: 2001, genre: "Fantasy" )
@nemo = @studio_2.movies.create!(title: "Finding Nemo", creation_year: 2004, genre: "Animation" )
