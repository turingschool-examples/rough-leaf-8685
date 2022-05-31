require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  it 'can order actors by youngest to oldest' do
    @studio_1 = Studio.create!(name: 'Paramount', location: "Hollywoo")
    @studio_2 = Studio.create!(name: 'Pixar', location: "Orlando")
    @sw = @studio_1.movies.create!(title: "Star Wars", creation_year: 1984, genre: "Sci-fi" )
    @lotr = @studio_1.movies.create!(title: "Lord of the Rings", creation_year: 2001, genre: "Fantasy" )
    @nemo = @studio_2.movies.create!(title: "Finding Nemo", creation_year: 2004, genre: "Animation" )
    @luke = @sw.actors.create!(name: "Mark Hamill", age: 53)
    @han = @sw.actors.create!(name: "Harrison Ford", age: 62)
    @leia = @sw.actors.create!(name: "Carrie Fisher", age: 58)

    expect(@sw.actors_by_age).to eq([@luke, @leia, @han])
  end

  it 'can give the average age of all the movies actors' do
    @studio_1 = Studio.create!(name: 'Paramount', location: "Hollywoo")
    @studio_2 = Studio.create!(name: 'Pixar', location: "Orlando")
    @sw = @studio_1.movies.create!(title: "Star Wars", creation_year: 1984, genre: "Sci-fi" )
    @lotr = @studio_1.movies.create!(title: "Lord of the Rings", creation_year: 2001, genre: "Fantasy" )
    @nemo = @studio_2.movies.create!(title: "Finding Nemo", creation_year: 2004, genre: "Animation" )
    @luke = @sw.actors.create!(name: "Mark Hamill", age: 53)
    @han = @sw.actors.create!(name: "Harrison Ford", age: 62)
    @leia = @sw.actors.create!(name: "Carrie Fisher", age: 58)

    expect(@sw.avg_actors_age.round).to eq(58)
  end
end