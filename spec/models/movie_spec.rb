require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe 'instance methods' do
    it "orders the actors by age ascending" do
      studio1 = Studio.create!(name: "Lucas Arts", location: "California")
      studio2 = Studio.create!(name: "Paramount", location: "New York")
      movie1 = studio1.movies.create!(title: "Wall-E", creation_year: 2009, genre: "Animation")
      movie2 = studio1.movies.create!(title: "Pocahontas", creation_year: 1994, genre: "Action")
      movie3 = studio2.movies.create!(title: "Spirited Away", creation_year: 2007, genre: "Mystery")
      movie4 = studio2.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Drama")
      actor1 = movie1.actors.create!(name: "Sandy", age: 80)
      actor2 = movie1.actors.create!(name: "Cory", age: 20)
      actor3 = movie2.actors.create!(name: "Bill", age: 40)

      expect(movie1.actors).to eq([actor1, actor2])
      expect(movie1.actor_sort_by_age).to eq([actor2, actor1])
    end

    it "averages the age of all the actors" do
      studio1 = Studio.create!(name: "Lucas Arts", location: "California")
      studio2 = Studio.create!(name: "Paramount", location: "New York")
      movie1 = studio1.movies.create!(title: "Wall-E", creation_year: 2009, genre: "Animation")
      movie2 = studio1.movies.create!(title: "Pocahontas", creation_year: 1994, genre: "Action")
      movie3 = studio2.movies.create!(title: "Spirited Away", creation_year: 2007, genre: "Mystery")
      movie4 = studio2.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Drama")
      actor1 = movie1.actors.create!(name: "Sandy", age: 80)
      actor2 = movie1.actors.create!(name: "Cory", age: 20)
      actor3 = movie2.actors.create!(name: "Bill", age: 40)

      expect(movie1.avg_age).to eq 50
    end
  end
end
