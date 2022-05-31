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
end
