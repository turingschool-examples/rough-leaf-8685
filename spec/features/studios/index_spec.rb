require 'rails_helper'

RSpec.describe Studio, type: :feature do
  describe 'the index page' do

    it 'tests user story 1' do
      # As a user,
      # When I visit the studio index page
      # I see a each studio's name and location
      # And underneath each studio, I see the titles of all of its movies.

      studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      movie_1 = studio_1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Aciton/Adventure")
      movie_2 = studio_1.movies.create!(title: "Terminator", creation_year: 1984, genre: "Sci-Fi")

      studio_2 = Studio.create!(name: "Pixar", location: "San Francisco")
      movie_3 = studio_2.movies.create!(title: "Toy Story", creation_year: 1994, genre: "Family")
      movie_4 = studio_2.movies.create!(title: "Wall-E", creation_year: 2009, genre: "Family")

      # binding.pry

      visit "/studios/"
      # save_and_open_page

      within "#studio-#{studio_1.id}" do
        expect(page).to have_content(studio_1.name)
        expect(page).to have_content(studio_1.location)
        expect(page).to have_content(movie_1.title)
        expect(page).to have_content(movie_2.title)

        expect(page).to_not have_content(studio_2.name)
        expect(page).to_not have_content(studio_2.location)
        expect(page).to_not have_content(movie_3.title)
        expect(page).to_not have_content(movie_4.title)
      end

      within "#studio-#{studio_2.id}" do
        expect(page).to_not have_content(studio_1.name)
        expect(page).to_not have_content(studio_1.location)
        expect(page).to_not have_content(movie_1.title)
        expect(page).to_not have_content(movie_2.title)

        expect(page).to have_content(studio_2.name)
        expect(page).to have_content(studio_2.location)
        expect(page).to have_content(movie_3.title)
        expect(page).to have_content(movie_4.title)
      end

    end
  end
end
