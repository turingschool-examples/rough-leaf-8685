require 'rails_helper'

RSpec.describe "Actors Show View", type: :feature do
  describe "Extension - Coactors" do
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
    let!(:actor_movie5) { ActorMovie.create!(actor: biff, movie: bttf) }
    # As a user,
    # When I visit an actor's show page
    # I see that actors name and age
    # And I see a unique list of all of the actors this particular actor has worked with.

    it "shows the actor's attributes and a list of actors they have worked with" do
      visit "/actors/#{marty.id}"

      expect(page).to have_content("Michael J. Fox")
      expect(page).to have_content("Age: 60")

      expect(page).to have_content("People they've acted with:")
      expect(page).to have_content("Christopher Lloyd")
      expect(page).to have_content("Thomas F. Wilson")
      expect(page).to_not have_content("Harrison Ford")
    end
  end
end
