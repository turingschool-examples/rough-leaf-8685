require 'rails_helper'

RSpec.describe Studio, type: :feature do
  describe "index page" do
    it "displays the studio name, location, all the studio's movie titles" do
      studio1 = Studio.create!(name: "Studio1", location: "Location1")
      studio2 = Studio.create!(name: "Studio2", location: "Location2")
      movie1 = studio1.movies.create!(title: "Movie1", creation_year: 1960, genre: "genre1")
      movie2 = studio1.movies.create!(title: "Movie2", creation_year: 1970, genre: "genre1")
      movie3 = studio1.movies.create!(title: "Movie3", creation_year: 1980, genre: "genre2")
      movie4 = studio2.movies.create!(title: "Movie4", creation_year: 1990, genre: "genre2")
      movie5 = studio2.movies.create!(title: "Movie5", creation_year: 2000, genre: "genre3")
    
      visit '/studios'
        within("#studio-Studio1") do
          expect(page).to have_content("Studio1")
          expect(page).to have_content("Location1")
          expect(page).to have_content("Movie1")
          expect(page).to have_content("Movie2")
          expect(page).to have_content("Movie3")
          expect(page).to_not have_content("Studio2")
          expect(page).to_not have_content("Movie4")
        end
    end
  end
end