require 'rails_helper'

RSpec.describe "Studios", type: :feature do
  describe "studios index" do
    it 'lists all studios locations and movies' do

      paramount = Studio.create!(name: "Paramount", location: 'Burbank, CA')
      tyler = Studio.create!(name: "Perry Studios", location: 'Atlanta, GA')
      top_gun = Movie.create!(title: "Top Gun", creation_year: 2020, genre: "action", studio_id: paramount.id)
      die_harder = Movie.create!(title: "Die Hard 46", creation_year: 1998, genre: "action", studio_id: tyler.id)
      madea = Movie.create!(title: "Madea", creation_year: 2010, genre: "comedy", studio_id: tyler.id)

      visit "/studios"
save_and_open_page
      expect(page).to have_content("Paramount")
      expect(page).to have_content("Burbank, CA")
      expect(page).to have_content("Top Gun")
      expect(page).to have_content("Perry Studios")
      expect(page).to have_content("Die Hard 46")
      expect(page).to have_content("Madea")
    end
  end
end
