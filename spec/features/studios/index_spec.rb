require 'rails_helper'

RSpec.describe "Studio Index" do
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio_2 = Studio.create!(name: "Super Real Studios", location: "Bollywood")
    @studio_3 = Studio.create!(name: "Pixar", location: "Annaheim")

    @movie_1 = @studio_1.movies.create!(title: "Cool Movie", creation_year: 1986, genre: "Superhero")
    @movie_2 = @studio_2.movies.create!(title: "Bad Movie", creation_year: 1988, genre: "Horror")
    @movie_3 = @studio_2.movies.create!(title: "Sandy Beach", creation_year: 2001, genre: "Romance")
    @movie_4 = @studio_3.movies.create!(title: "Action Boys", creation_year: 1999, genre: "Drama")
  end

  it "displays a studio's information" do
    visit "/studios"

    expect(page).to have_content("Universal Studios")
    expect(page).to have_content("Super Real Studios")
    expect(page).to have_content("Pixar")
    expect(page).to_not have_content("Sony Animcation Studios")

    expect(page).to have_content("Hollywood")
    expect(page).to have_content("Bollywood")
    expect(page).to have_content("Annaheim")
    expect(page).to_not have_content("Toronto")

    within "#studio-#{@studio_1.id}" do
      expect(page).to have_content("Cool Movie")
      expect(page).to_not have_content("Bad Movie")
    end

    within "#studio-#{@studio_2.id}" do
      expect(page).to have_content("Bad Movie")
      expect(page).to have_content("Sandy Beach")
      expect(page).to_not have_content("Cool Movie")
    end

    within "#studio-#{@studio_3.id}" do
      expect(page).to have_content("Action Boys")
      expect(page).to_not have_content("Bad Movie")
    end
  end
end
