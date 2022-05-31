require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
  end

  describe 'instance methods'
    it "#young_to_old" do
      ford = Actor.create!(name: "Harrison Ford", age: 78)
      allen = Actor.create!(name: "Karen Allen", age: 70)
      lucas = Actor.create!(name: "George Lucas", age: 79)

      univ = Studio.create!(name: "Universal Studios", location: "Hollywood")

      movie1 = univ.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: 'Action/Adventure')

      actor_movie1 = ActorMovie.create!(actor_id: ford.id, movie_id: movie1.id)
      actor_movie2 = ActorMovie.create!(actor_id: allen.id, movie_id: movie1.id)
      actor_movie2 = ActorMovie.create!(actor_id: lucas.id, movie_id: movie1.id)

      expect(movie1.young_to_old).to eq([allen, ford, lucas])
    end
end
