require 'rails_helper'

RSpec.describe Movie, type: :feature do
  describe 'the show page' do

    it 'tests user story 2' do
      # As a user,
      # When I visit a movie's show page.
      # I see the movie's title, creation year, and genre,
      # and a list of all its actors from youngest to oldest.
      # And I see the average age of all of the movie's actors

      studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      movie_1 = studio_1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Aciton/Adventure")

      studio_2 = Studio.create!(name: "Pixar", location: "San Francisco")
      movie_2 = studio_2.movies.create!(title: "Toy Story", creation_year: 1994, genre: "Family")

      actor_1 = Actor.create!(name: "Harrison Ford", age: 70)
      actor_2 = Actor.create!(name: "Karen Allen", age: 64)
      actor_3 = Actor.create!(name: "Paul Freeman", age: 74)
      actor_4 = Actor.create!(name: "Tom Hanks", age: 65)
      actor_5 = Actor.create!(name: "Tim Allen", age: 65)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_4.id, movie_id: movie_2.id)
      ActorMovie.create!(actor_id: actor_5.id, movie_id: movie_2.id)

      # binding.pry

      visit "/movies/#{movie_1.id}"

      save_and_open_page
      #
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.creation_year)
      expect(page).to have_content(movie_1.genre)

      expect(page).to_not have_content(movie_2.title)
      expect(page).to_not have_content(movie_2.creation_year)
      expect(page).to_not have_content(movie_2.genre)

      expect(page).to_not have_content(actor_4.name)
      expect(page).to_not have_content(actor_5.name)

      expect(actor_2.name).to appear_before(actor_1.name)
      expect(actor_1.name).to appear_before(actor_3.name)

      expect(page).to have_content("Average Age of all Actors on this Movie: 69.33")


    end
  end
end
