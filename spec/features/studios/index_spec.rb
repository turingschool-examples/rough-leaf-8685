require 'rails_helper'

RSpec.describe "Studio Index View", type: :feature do
  describe "Story 1 - Studio Index" do
    # As a user,
    # When I visit the studio index page
    # I see a each studio's name and location
    # And underneath each studio, I see the titles of all of its movies.
    it "has each studio's name and location, with each studio's movies" do
      studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      movie1 = Movie.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure", studio: studio1)
      movie3 = Movie.create!(title: "Back to the Future", creation_year: 1985, genre: "Science Fiction", studio: studio1)
      actor1 = Actor.create!(name: "Harrison Ford", age: 78)
      actor3 = Actor.create!(name: "Michael J. Fox", age: 60)
      actor_movie1 = ActorMovie.create!(actor: actor1, movie: movie1)
      actor_movie3 = ActorMovie.create!(actor: actor3, movie: movie3)

      studio2 = Studio.create!(name: "Sony Pictures Classics", location: "New York")
      movie2 = Movie.create!(title: "American Movie", creation_year: 1999, genre: "Documentary", studio: studio2)
      actor2 = Actor.create!(name: "Mark Borchardt", age: 55)
      actor_movie2 = ActorMovie.create!(actor: actor2, movie: movie2)

      visit "/studios"

      expect(page).to have_content("Studio: Universal Studios")
      expect(page).to have_content("Location: Hollywood")
      expect(page).to have_content("Studio: Sony Pictures Classics")
      expect(page).to have_content("Location: New York")

      within "#studio-#{studio1.id}" do
        expect(page).to have_content("Raiders of the Lost Ark")
        expect(page).to have_content("Back to the Future")
        expect(page).to_not have_content("American Movie")
      end

      within "#studio-#{studio2.id}" do
        expect(page).to have_content("American Movie")
        expect(page).to_not have_content("Raiders of the Lost Ark")
        expect(page).to_not have_content("Back to the Future")
      end
    end
  end
end
