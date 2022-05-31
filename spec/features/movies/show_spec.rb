require 'rails_helper'

RSpec.describe Movie, type: :feature do
  describe "show page" do
    it "displays the movie title, creation year, genre" do
      studio1 = Studio.create!(name: "Studio1", location: "Location1")
      movie1 = studio1.movies.create!(title: "Movie1", creation_year: 1960, genre: "genre1")
      movie2 = studio1.movies.create!(title: "Movie2", creation_year: 1970, genre: "genre2")
      actor1 = Actor.create!(name: "YoungActor", age: 20)
      actor2 = Actor.create!(name: "OldActor", age: 80)
      actor3 = Actor.create!(name: "MiddleActor", age: 50)
      actor4 = Actor.create!(name: "OtherActor", age: 30)
      actor_movie1 = ActorMovie.create!(actor_id: actor1.id, movie_id: movie1.id)
      actor_movie2 = ActorMovie.create!(actor_id: actor2.id, movie_id: movie1.id)
      actor_movie3 = ActorMovie.create!(actor_id: actor3.id, movie_id: movie1.id)
      actor_movie4 = ActorMovie.create!(actor_id: actor4.id, movie_id: movie2.id)

      visit "/movies/#{movie1.id}"
      save_and_open_page

      expect(page).to have_content("Movie1")
      expect(page).to have_content("1960")
      expect(page).to have_content("genre1")
      expect(page).to_not have_content("Movie2")
    end

    it "displays all the movie's actors from youngest to oldest" do
      studio1 = Studio.create!(name: "Studio1", location: "Location1")
      movie1 = studio1.movies.create!(title: "Movie1", creation_year: 1960, genre: "genre1")
      actor1 = Actor.create!(name: "YoungActor", age: 20)
      actor2 = Actor.create!(name: "OldActor", age: 80)
      actor3 = Actor.create!(name: "MiddleActor", age: 50)
      actor_movie1 = ActorMovie.create!(actor_id: actor1.id, movie_id: movie1.id)
      actor_movie2 = ActorMovie.create!(actor_id: actor2.id, movie_id: movie1.id)
      actor_movie3 = ActorMovie.create!(actor_id: actor3.id, movie_id: movie1.id)

      
      visit "/movies/#{movie1.id}"
        # within("#Actors") do
          expect("YoungActor").to appear_before("MiddleActor")
          expect("MiddleActor").to appear_before("OldActor")
          expect("OldActor").to_not appear_before("YoungActor")
        # end
    end

    it "displays the average age of its actors" do
      studio1 = Studio.create!(name: "Studio1", location: "Location1")
      movie1 = studio1.movies.create!(title: "Movie1", creation_year: 1960, genre: "genre1")
      actor1 = Actor.create!(name: "YoungActor", age: 20)
      actor2 = Actor.create!(name: "OldActor", age: 80)
      actor3 = Actor.create!(name: "MiddleActor", age: 50)
      actor_movie1 = ActorMovie.create!(actor_id: actor1.id, movie_id: movie1.id)
      actor_movie2 = ActorMovie.create!(actor_id: actor2.id, movie_id: movie1.id)
      actor_movie3 = ActorMovie.create!(actor_id: actor3.id, movie_id: movie1.id)

      
      visit "/movies/#{movie1.id}"
        within("#Average") do
          expect(page).to have_content("Average age of all actors: 50.0")
        end
    end
  end
end