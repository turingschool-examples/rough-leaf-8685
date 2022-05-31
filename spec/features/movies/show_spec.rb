require 'rails_helper'

RSpec.describe 'the movie show page', type: :feature do
# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
  it 'displays movie title, creation year, genre' do
    warner_bros = Studio.create!(name: "Warner Brothers", location: "Los Angeles")
    jurassic = warner_bros.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-Fi")
    true_romance = warner_bros.movies.create!(title: "True Romance", creation_year: 1995, genre: "Romance")

    visit "/movies/#{jurassic.id}"

    expect(page).to have_content("Jurassic Park")
    expect(page).to have_content(1993)
    expect(page).to have_content("Sci-Fi")
    expect(page).to_not have_content("True Romance")
  end

  it 'lists all actors in each movie youngest to oldest' do
    warner_bros = Studio.create!(name: "Warner Brothers", location: "Los Angeles")
    jurassic = warner_bros.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-Fi")
    true_romance = warner_bros.movies.create!(title: "True Romance", creation_year: 1995, genre: "Romance")

    sam = Actor.create!(name: "Sam Neill", age: 70)
    laura = Actor.create!(name: "Laura Dern", age: 55)
    harrison = Actor.create!(name: "Harrison Ford", age: 78)

    MovieActor.create!(movie: jurassic, actor: sam)
    MovieActor.create!(movie: jurassic, actor: laura)
    MovieActor.create!(movie: true_romance, actor: harrison)

    visit "/movies/#{jurassic.id}"
    expect(page).to have_content("Sam Neill")
    expect(page).to have_content("Laura Dern")
    expect(page).to_not have_content("Harrison Ford")
  end
end
