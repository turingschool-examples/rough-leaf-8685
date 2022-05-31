require 'rails_helper'

RSpec.describe 'movie show page' do
  it "lists all of the movies and their attributes" do
    studio1 = Studio.create!(name: "Lucas Arts", location: "California")
    studio2 = Studio.create!(name: "Paramount", location: "New York")
    movie1 = studio1.movies.create!(title: "Wall-E", creation_year: 2009, genre: "Animation")
    movie2 = studio1.movies.create!(title: "Pocahontas", creation_year: 1994, genre: "Action")
    movie3 = studio2.movies.create!(title: "Spirited Away", creation_year: 2007, genre: "Mystery")
    movie4 = studio2.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Drama")
    actor1 = movie1.actors.create!(name: "Cory", age: 20)

    visit "movies/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.creation_year)
    expect(page).to have_content(movie1.genre)
    expect(page).to_not have_content(movie2.title)
    expect(page).to_not have_content(movie2.creation_year)
    expect(page).to_not have_content(movie2.genre)
  end

  it "lists all the actors for a given movie and their average age" do
    studio1 = Studio.create!(name: "Lucas Arts", location: "California")
    studio2 = Studio.create!(name: "Paramount", location: "New York")
    movie1 = studio1.movies.create!(title: "Wall-E", creation_year: 2009, genre: "Animation")
    movie2 = studio1.movies.create!(title: "Pocahontas", creation_year: 1994, genre: "Action")
    movie3 = studio2.movies.create!(title: "Spirited Away", creation_year: 2007, genre: "Mystery")
    movie4 = studio2.movies.create!(title: "Princess Mononoke", creation_year: 1997, genre: "Drama")
    actor1 = movie1.actors.create!(name: "Sandy", age: 80)
    actor2 = movie1.actors.create!(name: "Cory", age: 20)
    actor3 = movie2.actors.create!(name: "Bill", age: 40)

    visit "movies/#{movie1.id}"

    expect(page).to have_content(actor1.name)
    expect(page).to have_content(actor2.name)
    expect(page).to have_content("50")
    expect(actor2.name).to appear_before(actor1.name)
    expect(page).to_not have_content(actor3.name)
  end
end
