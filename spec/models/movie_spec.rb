require 'rails_helper'

RSpec.describe Movie do
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

    @star_wars = @studio_1.movies.create!(title: "Star Wars", creation_year: "1991", genre: "Fantasy")
    @how_high = @studio_1.movies.create!(title: "How High", creation_year: "1994", genre: "comedy")

    @ford = Actor.create!(name: "Harrison Ford", age: 80)
    @portman = Actor.create!(name: "Natalie Portman", age: 40)
    @chappelle = Actor.create!(name: "Dave Chappelle", age: 62)

    @movieactor_1 = MovieActor.create!(movie_id: @star_wars.id, actor_id: @ford.id)
    @movieactor_2 = MovieActor.create!(movie_id: @star_wars.id, actor_id: @portman.id)
  end

  describe 'relationships' do
    it { should belong_to :studio }
  end

  describe 'instance methods' do
    it "sorts actors in a movie by age youngest to oldest" do
      expect(@star_wars.age_sort).to eq([@portman,@ford])
    end

    it "gives average age of actors in specific movie" do
      expect(@star_wars.avg_age).to eq(60)
    end
  end
end
