require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe "instance methods" do

    before :each do
      @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

      @movie_1 = @studio_1.movies.create!(title: "Cool Movie", creation_year: 1986, genre: "Superhero")
      @movie_2 = @studio_1.movies.create!(title: "Bad Movie", creation_year: 1988, genre: "Horror")

      @actor_1 = Actor.create!(name: "Billy Bob Thorton", age: 69)
      @actor_2 = Actor.create!(name: "Allison Brie", age: 44)
      @actor_3 = Actor.create!(name: "John Belushi", age: 22)

      @act_movie_1 = ActorMovie.create!(actor_id: @actor_1.id, movie_id: @movie_1.id)
      @act_movie_2 = ActorMovie.create!(actor_id: @actor_2.id, movie_id: @movie_1.id)
      @act_movie_3 = ActorMovie.create!(actor_id: @actor_3.id, movie_id: @movie_2.id)
    end

    it ".all_actors" do
      expect(@movie_1.all_actors).to eq(["Billy Bob Thorton", "Allison Brie"])
    end

    it ".average_age" do
      expect(@movie_1.average_age).to eq(56.5)
    end
  end
end
