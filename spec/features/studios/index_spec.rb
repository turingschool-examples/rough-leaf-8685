require 'rails_helper'

RSpec.describe 'Studio index page', type: :feature do
  it 'shows each studios name and location' do
    uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
    dis = Studio.create!(name: "Disney", location: "Florida")

    visit '/studios'

    expect(page).to have_content("Universal Studios, located in Hollywood")
    expect(page).to have_content("Disney, located in Florida")
  end

  it 'shows the title of its movies underneath the studios' do
    uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
    dis = Studio.create!(name: "Disney", location: "Florida")
    sw = dis.movies.create(title: "Star Wars", creation_year: "1984", genre: "Sci-Fi/Adventure")
    moana = dis.movies.create(title: "Moana", creation_year: "2020", genre: "Family/Adventure")
    die = uni.movies.create(title: "Die Hard", creation_year: "1989", genre: "Action")
    bond = uni.movies.create(title: "007", creation_year: "2007", genre: "Action/Spy")

    visit '/studios'
save_and_open_page
      expect(page).to have_content('Die Hard')
      expect(page).to have_content('Created in: 1989')
      expect(page).to have_content('Genre: Action')
      #expect(page).to_not have_content('Moana')
      #expect(page).to_not have_content('Star Wars')

  end


end
