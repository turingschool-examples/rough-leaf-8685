require 'rails_helper'

describe 'studio index page' do
  before do
    @marvel = Studio.create!(name: "Marvel Studios", location: "Burbank")
    @universal = Studio.create!(name: "Universal Studios", location: "Orlando")

    @marvel.movies.create!(title: "Spider-Man", creation_year: 2021, genre: "action")
    @marvel.movies.create!(title: "Thor", creation_year: 2017, genre: "action")
    @marvel.movies.create!(title: "Iron Man", creation_year: 2013, genre: "action")

    @universal.movies.create!(title: "Jurassic Park", creation_year: 1993, genre: "sci-fi")
    @universal.movies.create!(title: "Sing", creation_year: 2016, genre: "music")
  end

  it "displays each studio's name, location and movies associated" do
    visit '/studios'
    save_and_open_page
    within "#studio-#{@marvel.id}" do
      expect(page).to have_content("Marvel Studios")
      expect(page).to_not have_content("Universal Studios")

      expect(page).to have_content("Burbank")
      expect(page).to_not have_content("Orlando")

      expect(page).to have_content("Spider-Man")
      expect(page).to have_content("Thor")
      expect(page).to have_content("Iron Man")
      expect(page).to_not have_content("Sing")
    end

    within "#studio-#{@universal.id}" do
      expect(page).to have_content("Universal Studios")
      expect(page).to_not have_content("Marvel Studios")

      expect(page).to have_content("Orlando")
      expect(page).to_not have_content("Burbank")

      expect(page).to have_content("Jurassic Park")
      expect(page).to have_content("Sing")
      expect(page).to_not have_content("Iron Man")
    end
  end
end
