require 'rails_helper'

RSpec.describe "Studio Index" do
   before :each do
    @studio = Studio.create!(name: "Walt Disney", location: "Hollywood" )
    @studio2 = Studio.create!(name: "Imagination", location: "Denzeltrees")
    @movie1 = @studio.movies.create!(title: "Star Wars", creation_year: 1986, genre: "Sci-fi" )
    @movie2 = @studio.movies.create!(title: "Dunkin", creation_year: 2001, genre: "Action" )
    @movie3 = @studio2.movies.create!(title: "Star Scepter", creation_year: 1960, genre: "Drama" )

  end

  it "can display the studios attributes and movie titles" do
    visit '/studios'
  
    expect(page).to have_content("Walt Disney")
    expect(page).to have_content("Hollywood")
    expect(page).to have_content("Star Wars")
    expect(page).to have_content("Dunkin")
    expect(page).to have_content("Imagination")
    expect(page).to have_content("Denzeltrees")
    expect(page).to have_content("Star Scepter")

  end
end
