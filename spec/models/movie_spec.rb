require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :movie_actors}
    it { should have_many(:actors).through(:movie_actors)}
  end
  describe '#actors_youngest_first' do
    it 'should order by youngest age first' do
        @studio4 = Studio.create!(name: "Warner Brothers", location: "Burbank")
        @movie8 = @studio4.movies.create(title: "Another Warner Brothers Movie", creation_year: 2011, genre: "Romantic Comedy")
    
        @actor1 = Actor.create!(name: "Harrison Ford", age: 79)
        @actor2 = Actor.create!(name: "Mark Hamill", age: 70)
        @actor3 = Actor.create!(name: "Alec Guiness", age: 86)
        @actor4 = Actor.create!(name: "Carrie Fisher", age: 60)

        MovieActor.create(actor_id: @actor1.id, movie_id: @movie8.id)
        MovieActor.create(actor_id: @actor2.id, movie_id: @movie8.id)
        MovieActor.create(actor_id: @actor3.id, movie_id: @movie8.id)
        MovieActor.create(actor_id: @actor4.id, movie_id: @movie8.id)

        expect(@movie8.actors_youngest_first).to eq([@actor4, @actor2, @actor1, @actor3])
    end
  end

  describe '#actors_average_age' do
    it 'should get average age of actors' do
        @studio4 = Studio.create!(name: "Warner Brothers", location: "Burbank")
        @movie8 = @studio4.movies.create(title: "Another Warner Brothers Movie", creation_year: 2011, genre: "Romantic Comedy")
    
        @actor1 = Actor.create!(name: "Harrison Ford", age: 79)
        @actor2 = Actor.create!(name: "Mark Hamill", age: 70)
        @actor3 = Actor.create!(name: "Alec Guiness", age: 86)
        @actor4 = Actor.create!(name: "Carrie Fisher", age: 60)

        MovieActor.create(actor_id: @actor1.id, movie_id: @movie8.id)
        MovieActor.create(actor_id: @actor2.id, movie_id: @movie8.id)
        MovieActor.create(actor_id: @actor3.id, movie_id: @movie8.id)
        MovieActor.create(actor_id: @actor4.id, movie_id: @movie8.id)

        expect(@movie8.actors_average_age).to eq(73.75)
    end
  end
end