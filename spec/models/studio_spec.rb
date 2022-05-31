require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it { should have_many :movies }
  end

  describe 'model methods' do
    it 'tests the studio movies method' do
      studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
      movie_1 = studio_1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Aciton/Adventure")
      movie_2 = studio_1.movies.create!(title: "Terminator", creation_year: 1984, genre: "Sci-Fi")

      studio_2 = Studio.create!(name: "Pixar", location: "San Francisco")
      movie_3 = studio_2.movies.create!(title: "Toy Story", creation_year: 1994, genre: "Family")
      movie_4 = studio_2.movies.create!(title: "Wall-E", creation_year: 2009, genre: "Family")

      expect(studio_1.studio_movies).to eq("Raiders of the Lost Ark, Terminator")
      expect(studio_2.studio_movies).to eq("Toy Story, Wall-E")
    end
  end
end
