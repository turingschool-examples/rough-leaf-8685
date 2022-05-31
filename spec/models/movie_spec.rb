require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it {should have_many(:actor_movies)}
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe 'methods' do
    it 'gives me the actors younges to oldest' do

      studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      movie_1 = studio_1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Aciton/Adventure")

      actor_1 = Actor.create!(name: "Harrison Ford", age: 70)
      actor_2 = Actor.create!(name: "Karen Allen", age: 64)
      actor_3 = Actor.create!(name: "Paul Freeman", age: 74)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)

      expect(movie_1.actors_age_ascending).to eq("Karen Allen, Harrison Ford, Paul Freeman")

    end

    it 'gives me the average age of the actors' do
      studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      movie_1 = studio_1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Aciton/Adventure")

      actor_1 = Actor.create!(name: "Harrison Ford", age: 70)
      actor_2 = Actor.create!(name: "Karen Allen", age: 64)
      actor_3 = Actor.create!(name: "Paul Freeman", age: 74)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)

      expect(movie_1.average_actors_age.round(2)).to eq(69.33)
    end
  end
end
