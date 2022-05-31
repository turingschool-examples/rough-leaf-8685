require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :actor_movies }
    it { should have_many(:movies).through(:actor_movies) }
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
    describe "#find_coactors" do
      it "finds all coactors from previous films" do
        expect(@actor_1.find_coactors).to eq([@actor_3.name, @actor_2.name, @actor_1.name])
      end
      
    end
  end
  
  
end