require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:movie_actors) }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe 'instance methods' do
    it 'displays its actors from youngest to oldest' do
      warner_bros = Studio.create!(name: "Warner Brothers", location: "Los Angeles")
      jurassic = warner_bros.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "Sci-Fi")

      sam = Actor.create!(name: "Sam Neill", age: 70)
      laura = Actor.create!(name: "Laura Dern", age: 55)

      MovieActor.create!(movie: jurassic, actor: sam)
      MovieActor.create!(movie: jurassic, actor: laura)

      expect(jurassic.sort_actors_by_age).to eq([laura, sam])
    end
  end
end
