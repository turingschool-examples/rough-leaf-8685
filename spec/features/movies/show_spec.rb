require 'rails_helper'

RSpec.describe 'Movie Show Page' do 
  let!(:studio2) { Studio.create(name: 'Studio Ghibli', location: 'Japan') }

  let!(:movie2) { studio2.movies.create(title: 'Spirited Away', creation_year: 2002, genre: 'Drama') }  

  let!(:actor1) { Actor.create!(name: 'Daveigh Chase', age: 32)}
  let!(:actor2) { Actor.create!(name: 'Miyu Irino', age: 51)}
  let!(:actor3) { Actor.create!(name: 'Mari Natsuki', age: 48)}

  let!(:movie_actor1) { MovieActor.create!(actor_id: actor1.id, movie_id: movie2.id)}
  let!(:movie_actor2) { MovieActor.create!(actor_id: actor2.id, movie_id: movie2.id)}
  let!(:movie_actor3) { MovieActor.create!(actor_id: actor3.id, movie_id: movie2.id)}

  describe 'user story 2' do 
    it 'has movie attributes' do 
      visit "movies/#{movie2.id}"

      expect(page).to have_content(movie2.title)
      expect(page).to have_content(movie2.creation_year)
      expect(page).to have_content(movie2.genre)
    end

    it 'can list the actors from youngest to oldest' do 
      visit "movies/#{movie2.id}"
save_and_open_page
      expect(page).to have_content(actor1.name)
      expect(page).to have_content(actor2.name)
      expect(page).to have_content(actor3.name)
      expect("Daveigh Chase").to appear_before("Mari Natsuki")
      expect("Mari Natsuki").to appear_before("Miyu Irino")
    end
  end
end