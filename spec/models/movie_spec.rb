require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many :actors }
  end

  describe 'behaviors' do
    it 'can sort actors by age' do
      marvel = Studio.create!(name: 'Marvel', location: 'Denver, CO')

      iron_man = marvel.movies.create!(title: 'Iron Man', creation_year: '2008', genre: 'Action')
      captain_america = marvel.movies.create!(title: 'Captain America', creation_year: '2010', genre: 'Action')
      thor = marvel.movies.create!(title: 'Thor', creation_year: '2011', genre: 'Action')

      robertdj = Actor.create!(name: 'Robert Downey Jr.', age: 45)
      sarahjp = Actor.create!(name: 'Sarah Jessica Parker', age: 44)
      jamesc = Actor.create!(name: 'James Cameron', age: 43)

      chris_h = Actor.create!(name: 'Chris Hemsworth', age: 35)

      am1 = ActorMovie.create!(actor_id: robertdj.id, movie_id: iron_man.id)
      am2 = ActorMovie.create!(actor_id: sarahjp.id, movie_id: iron_man.id)
      am3 = ActorMovie.create!(actor_id: jamesc.id, movie_id: iron_man.id)

      am4 = ActorMovie.create!(actor_id: chris_h.id, movie_id: captain_america.id)

      expect(iron_man.actors_by_age).to eq([jamesc, sarahjp, robertdj])
    end

    it 'can return the average age of actors' do
      marvel = Studio.create!(name: 'Marvel', location: 'Denver, CO')

      iron_man = marvel.movies.create!(title: 'Iron Man', creation_year: '2008', genre: 'Action')
      captain_america = marvel.movies.create!(title: 'Captain America', creation_year: '2010', genre: 'Action')
      thor = marvel.movies.create!(title: 'Thor', creation_year: '2011', genre: 'Action')

      robertdj = Actor.create!(name: 'Robert Downey Jr.', age: 45)
      sarahjp = Actor.create!(name: 'Sarah Jessica Parker', age: 44)
      jamesc = Actor.create!(name: 'James Cameron', age: 43)

      chris_h = Actor.create!(name: 'Chris Hemsworth', age: 35)

      am1 = ActorMovie.create!(actor_id: robertdj.id, movie_id: iron_man.id)
      am2 = ActorMovie.create!(actor_id: sarahjp.id, movie_id: iron_man.id)
      am3 = ActorMovie.create!(actor_id: jamesc.id, movie_id: iron_man.id)

      am4 = ActorMovie.create!(actor_id: chris_h.id, movie_id: captain_america.id)

      expect(iron_man.average_actor_age).to eq(44)
    end
  end
end

