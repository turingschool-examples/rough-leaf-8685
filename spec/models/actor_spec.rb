require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it {should have_many(:actor_movies)}
    it {should have_many(:movies).through(:actor_movies)}
  end

  describe 'methods' do
    it 'gives me the unique co worker names' do
      studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      movie_1 = studio_1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Aciton/Adventure")
      movie_2 = studio_1.movies.create!(title: "Temple of Doom", creation_year: 1984, genre: "Aciton/Adventure")

      actor_1 = Actor.create!(name: "Harrison Ford", age: 70)
      actor_2 = Actor.create!(name: "Karen Allen", age: 64)
      actor_3 = Actor.create!(name: "Paul Freeman", age: 74)
      actor_4 = Actor.create!(name: "Kate Capshaw", age: 62)
      actor_5 = Actor.create!(name: "Amrish Puri", age: 65)
      actor_6 = Actor.create!(name: "George Lucas", age: 75)
      actor_7 = Actor.create!(name: "Tom Hanks", age: 59)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_6.id, movie_id: movie_1.id)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_2.id)
      ActorMovie.create!(actor_id: actor_4.id, movie_id: movie_2.id)
      ActorMovie.create!(actor_id: actor_5.id, movie_id: movie_2.id)
      ActorMovie.create!(actor_id: actor_6.id, movie_id: movie_2.id)

      expect(actor_1.unique_coworkers).to eq("Paul Freeman, Kate Capshaw, Amrish Puri, Karen Allen, George Lucas")
    end
  end
end
