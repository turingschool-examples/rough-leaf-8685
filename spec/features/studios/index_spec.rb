require 'rails_helper'

RSpec.describe 'Studio index page', type: :feature do

  it 'index page shows studio names and location' do
    studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    studio2 = Studio.create!(name: "Warner Bros.", location: "Los Angeles")
    movie1 = studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    movie2 = studio2.movies.create!(title: 'The Dark Knight', creation_year: 2008, genre: 'Action/Adventure')

    visit '/studios'
    within '#studio-0' do
      expect(page).to have_content("name: #{studio1.name}")
      expect(page).to have_content("location: #{studio1.location}")
      expect(page).to have_content("#{movie1.title}")

    end
    within '#studio-1' do
      expect(page).to have_content("name: #{studio2.name}")
      expect(page).to have_content("location: #{studio2.location}")
      expect(page).to have_content("#{movie2.title}")
    end
  end
end
