require 'rails_helper'

RSpec.describe 'the studio index page', type: :feature do
# As a user,
# When I visit the studio index page
# I see a each studio's name and location
# And underneath each studio, I see the titles of all of its movies.

  it 'displays each studio and location' do
    universal = Studio.create!(name: "Universal", location: "Hollywood")
    warner_bros = Studio.create!(name: "Warner Brothers", location: "Los Angeles")

    raiders = universal.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure")
    indiana = universal.movies.create!(title: "Indiana Jones", creation_year: 1979, genre: "Action/Adventure")
    jurassic = warner_bros.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-Fi")
    true_romance = warner_bros.movies.create!(title: "True Romance", creation_year: 1995, genre: "Romance")

    visit "/studios"
    expect(page).to have_content("Universal")
    expect(page).to have_content("Hollywood")
    expect(page).to have_content("Warner Brothers")
    expect(page).to have_content("Los Angeles")
    expect(page).to_not have_content("Columbia Pictures")
    expect(page).to_not have_content("San Francisco")
  end

  it 'displays each studios movies underneath' do
    universal = Studio.create!(name: "Universal", location: "Hollywood")
    warner_bros = Studio.create!(name: "Warner Brothers", location: "Los Angeles")

    raiders = universal.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure")
    indiana = universal.movies.create!(title: "Indiana Jones", creation_year: 1979, genre: "Action/Adventure")
    jurassic = warner_bros.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-Fi")
    true_romance = warner_bros.movies.create!(title: "True Romance", creation_year: 1995, genre: "Romance")

    visit "/studios"

      within "#universal-#{universal.id}" do
        expect(page).to have_content("Raiders of the Lost Ark")
        expect(page).to have_content("Indiana Jones")
        expect(page).to_not have_content("Jurassic Park")
        expect(page).to_not have_content("True Romance")
      end

      within "#warner_bros-#{warner_bros.id}" do
        expect(page).to have_content("Jurassic Park")
        expect(page).to have_content("True Romance")
        expect(page).to_not have_content("Raiders of the Lost Ark")
        expect(page).to_not have_content("Indiana Jones")
      end
  end
end
