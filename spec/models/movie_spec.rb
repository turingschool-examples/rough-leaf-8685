require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe "instance methods" do
    before :each do
        @studio_1 = Studio.create!(name: 'G Studios', location: 'Los Angeles')
        @movie_1 = @studio_1.movies.create!(title: 'NWA', creation_year: 2015, genre: 'Musical')
        @movie_2 = @studio_1.movies.create!(title: 'Dark Souls', creation_year: 2020, genre: 'Documentary')
        @actor_1 = Actor.create!(name: 'Johnny', age: 50)
        @actor_2 = Actor.create!(name: 'Harrison', age: 60)
        @actor_3 = Actor.create!(name: 'Angie', age: 40)
        @actor_4 = Actor.create!(name: 'Sarah', age: 30)
        ActorMovie.create!(actor_id: @actor_1.id, movie_id: @movie_1.id)
        ActorMovie.create!(actor_id: @actor_2.id, movie_id: @movie_1.id)
        ActorMovie.create!(actor_id: @actor_3.id, movie_id: @movie_1.id)
        ActorMovie.create!(actor_id: @actor_4.id, movie_id: @movie_2.id)
    end
    describe "#actors_by_age" do
      it "sorts the actors youngets to oldest" do
        expect(@movie_1.actors_by_age).to eq([@actor_3, @actor_1, @actor_2])
      end
    end
    describe "#actor_average_age" do
      it "finds average age of actors in a movie" do
        expect(@movie_1.actors_average_age).to eq(50)
      end
    end
  end
end