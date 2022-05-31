require 'rails_helper'

RSpec.describe "Studio Show Page" do
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @star_wars = @studio_1.movies.create!(title: "Star Wars", creation_year: "1991", genre: "fantasy")
    @how_high = @studio_1.movies.create!(title: "How High", creation_year: "1994", genre: "comedy")
  end

  it "shows studios name/location and all movies it has" do
    visit '/studios'
    expect(page).to have_content('Universal Studios')
    expect(page).to have_content('Hollywood')
    expect(page).to have_content('Star Wars')
    expect(page).to have_content('How High')
  end

end
