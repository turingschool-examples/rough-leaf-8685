require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it { should have_many :movies }
  end

  describe 'features' do
    it "displays the studio index" do
      studio1 = Studio.create!(name: "Lucas Arts", location: "California")
      studio2 = Studio.create!(name: "Paramount", location: "New York")
      movie1 = studio1.movies.create!(title: "Wall-E", creation_year: 2009, genre: "Animation")
      movie2 = studio1.movies.create!(title: "Pocahontas", creation_year: 1994, genre: "Animation")
      movie3 = studio2.movies.create!(title: "Spirited Away", creation_year: 2007, genre: "Animation")
      movie4 = studio2.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Animation")
      actor1 = movie1.actors.create!(name: "Cory", age: 20)

      visit '/studios'

      expect(page).to have_content(studio1.name)
      expect(page).to have_content(studio1.location)
      expect(page).to have_content(movie1.title)
      expect(page).to have_content(movie2.title)
      expect(page).to have_content(studio2.name)
      expect(page).to have_content(studio2.location)
      expect(page).to have_content(movie3.title)
      expect(page).to have_content(movie4.title)
      expect(page).to_not have_content(actor1.name)
    end
  end
end
