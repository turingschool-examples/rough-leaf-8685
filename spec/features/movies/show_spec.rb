require 'rails_helper'

RSpec.describe 'Movie Show Page' do 
  let!(:studio2) { Studio.create(name: 'Studio Ghibli', location: 'Japan') }

  let!(:movie2) { studio2.movies.create(title: 'Spirited Away', creation_year: 2002, genre: 'Drama') }  

  let!(:actor1) { Actor.create!(name: 'Daveigh Chase', age: 32)}
  let!(:actor2) { Actor.create!(name: 'Miyu Irino', age: 51)}
  let!(:actor3) { Actor.create!(name: 'Mari Natsuki', age: 48)}
  let!(:actor4) { Actor.create!(name: 'Jim Carrey', age: 60)}
  let!(:actor5) { Actor.create!(name: 'Suzanne Pleshette', age: 79)}


  let!(:movie_actor1) { MovieActor.create!(actor_id: actor1.id, movie_id: movie2.id)}
  let!(:movie_actor2) { MovieActor.create!(actor_id: actor2.id, movie_id: movie2.id)}
  let!(:movie_actor3) { MovieActor.create!(actor_id: actor3.id, movie_id: movie2.id)}
  let!(:movie_actor4) { MovieActor.create!(actor_id: actor5.id, movie_id: movie2.id)}


  describe 'user story 2' do 
    it 'has movie attributes' do 
      visit "movies/#{movie2.id}"

      expect(page).to have_content(movie2.title)
      expect(page).to have_content(movie2.creation_year)
      expect(page).to have_content(movie2.genre)
    end

    it 'can list the actors from youngest to oldest' do 
      visit "movies/#{movie2.id}"

      expect(page).to have_content(actor1.name)
      expect(page).to have_content(actor2.name)
      expect(page).to have_content(actor3.name)
      expect("Daveigh Chase").to appear_before("Mari Natsuki")
      expect("Mari Natsuki").to appear_before("Miyu Irino")
    end

    it 'can show the average age of all the actors' do 
      visit "movies/#{movie2.id}"

      expect(page).to have_content("Average age of actors: 52.5")
    end
  end

  describe 'user story 3' do 
    it 'has a form to add an actor to the movie' do 
      visit "movies/#{movie2.id}"

      expect(page).to_not have_content("Jim Carrey")
      expect(page).to have_content("Add an Actor")

      fill_in(:name, with: "Suzanne Pleshette")
      click_on('Submit')

      expect(current_path).to eq("/movies/#{movie2.id}")
      save_and_open_page

      expect(page).to have_content("Suzanne Pleshette")
    end
  end
end