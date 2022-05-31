require 'rails_helper'

RSpec.describe "Movies Show View", type: :feature do
  describe "Story 2 - Movie Show" do
    # As a user,
    # When I visit a movie's show page.
    # I see the movie's title, creation year, and genre,
    # and a list of all its actors from youngest to oldest.
    # And I see the average age of all of the movie's actors
    let!(:universal) { Studio.create!(name: "Universal Studios", location: "Hollywood") }
    let!(:raiders) { Movie.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure", studio: universal) }
    let!(:bttf) { Movie.create!(title: "Back to the Future", creation_year: 1985, genre: "Science Fiction", studio: universal) }
    let!(:indy) { Actor.create!(name: "Harrison Ford", age: 78) }
    let!(:doc) { Actor.create!(name: "Christopher Lloyd", age: 83) }
    let!(:marty) { Actor.create!(name: "Michael J. Fox", age: 60) }
    let!(:biff) { Actor.create!(name: "Thomas F. Wilson", age: 63) }
    let!(:actor_movie1) { ActorMovie.create!(actor: indy, movie: raiders) }
    let!(:actor_movie3) { ActorMovie.create!(actor: marty, movie: bttf) }
    let!(:actor_movie4) { ActorMovie.create!(actor: doc, movie: bttf) }
    let!(:actor_movie5) { ActorMovie.create!(actor: doc, movie: bttf) }

    let!(:studio2) { Studio.create!(name: "Sony Pictures Classics", location: "New York") }
    let!(:movie2) { Movie.create!(title: "American Movie", creation_year: 1999, genre: "Documentary", studio: studio2) }
    let!(:actor2) { Actor.create!(name: "Mark Borchardt", age: 55) }
    let!(:actor_movie2) { ActorMovie.create!(actor: actor2, movie: movie2) }

    it "shows all the movie's attributes" do
      visit "/movies/#{movie2.id}"

      expect(page).to have_content("American Movie")
      expect(page).to have_content("1999")
      expect(page).to have_content("Documentary")

      expect(page).to_not have_content("Raiders of the Lost Ark")
      expect(page).to_not have_content(1985)
      expect(page).to_not have_content("Science Fiction")
    end

    it "has a list of all its actors from youngest to oldest" do
      visit "/movies/#{bttf.id}"

      expect(marty.name).to appear_before(biff.name)
      expect(biff.name).to appear_before(doc.name)
    end

    it "has the average age of all of the movie's actors" do
      visit "/movies/#{bttf.id}"

      expect(page).to have_content("Average Age of Actors: 68.67")
    end
  end
end
