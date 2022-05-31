require 'rails_helper'

RSpec.describe Actor, type: :feature do
  describe 'the show page' do

    it 'tests extension 1' do
      # As a user,
      # When I visit an actor's show page
      # I see that actors name and age
      # And I see a unique list of all of the actors this particular actor has worked with.

      studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      movie_1 = studio_1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Aciton/Adventure")
      movie_2 = studio_1.movies.create!(title: "Temple of Doom", creation_year: 1984, genre: "Aciton/Adventure")

      actor_1 = Actor.create!(name: "Harrison Ford", age: 70)
      actor_2 = Actor.create!(name: "Karen Allen", age: 64)
      actor_3 = Actor.create!(name: "Paul Freeman", age: 74)
      actor_4 = Actor.create!(name: "Kate Capshaw", age: 62)
      actor_5 = Actor.create!(name: "Amrish Puri", age: 65)
      actor_6 = Actor.create!(name: "George Lucas", age: 75)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_6.id, movie_id: movie_1.id)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_2.id)
      ActorMovie.create!(actor_id: actor_4.id, movie_id: movie_2.id)
      ActorMovie.create!(actor_id: actor_5.id, movie_id: movie_2.id)
      ActorMovie.create!(actor_id: actor_6.id, movie_id: movie_2.id)

      # binding.pry

      visit "/actors/#{actor_1.id}"

      # save_and_open_page
      #
      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_1.age)
      expect(page).to have_content("Unique CoWorkers: #{actor_1.unique_coworkers}" )

    end
  end
end
