require 'rails_helper'

RSpec.describe "studio index page" do
  before :each do
    @studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio2 = Studio.create!(name: "Denver Film Company", location: "Denver")

    @movie1 = @studio1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: 'Action/Adventure')
    @movie2 = @studio1.movies.create!(title: "Red Notice", creation_year: 2021, genre: 'Action/Comedy')
    @movie3 = @studio1.movies.create!(title: "American Bystander", creation_year: 2016, genre: 'Drama')
    @movie4 = @studio1.movies.create!(title: "Feature Doc", creation_year: 2014, genre: 'Documentary')
  end

  it 'has each studios name, location, and all movie titles' do
    visit '/studio'
      within "##{@stuidio1.id}" do
      expect(page).to have_content("Universal Studios")
      expect(page).to have_content("Hollywood")
      expect(page).to have_content("Raiders of the Lost Ark")
      expect(page).to have_content("Red Notice")
    end
      within "##{@stuidio2.id}" do
      expect(page).to have_content("Denver Film Company")
      expect(page).to have_content("Denver")
      expect(page).to have_content("American Bystander")
      expect(page).to have_content("Feature Doc")
    end
  end
end
