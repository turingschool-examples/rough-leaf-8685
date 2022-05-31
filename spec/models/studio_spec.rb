require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it { should have_many(:movies)}
    it { should have_many(:actors).through(:movies)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
  end

  describe 'instance methods' do
    describe '#movie_titles' do
      it 'returns the titles of the studios movies' do
        marvel = Studio.create!(name: "Marvel Studios", location: "Burbank")
        universal = Studio.create!(name: "Universal Studios", location: "Orlando")

        marvel.movies.create!(title: "Spider-Man", creation_year: 2021, genre: "action")
        marvel.movies.create!(title: "Thor", creation_year: 2017, genre: "action")
        marvel.movies.create!(title: "Iron Man", creation_year: 2013, genre: "action")

        universal.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "sci-fi")

        expect(marvel.movie_titles).to eq(["Spider-Man", "Thor", "Iron Man"])
      end
    end
  end
end
