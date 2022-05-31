require "rails_helper"

RSpec.describe 'Studio Index Page' do
  before :each do
    @studio_1 = Studio.create!(name: 'Paramount', location: "Hollywoo")
    @studio_1 = Studio.create!(name: 'Pixar', location: "Orlando")
    @sw = @studio_1.movies.create!(title: "Star Wars", creation_year: 1984, genre: "Sci-fi" )
    @lotr = @studio_1.movies.create!(title: "Lord of the Rings", creation_year: 2001, genre: "Fantasy" )
    @nemo = @studio_2.movies.create!(title: "Finding Nemo", creation_year: 2004, genre: "Animation" )
  end

  it 'displays each studios name location and the titles of all its movies' do
    visit "/studios"

    within "#studio-#{studio_1.id}" do
      expect(page).to have_content('Paramount')
      expect(page).to have_content('Hollywoo')
      expect(page).to have_content('Star Wars')
      expect(page).to have_content('Lord of the Rings')
      expect(page).to_not have_content('Pixar')
      expect(page).to_not have_content('Finding Nemo')
    end

    within "#studio-#{studio_2.id}" do
      expect(page).to have_content('Pixar')
      expect(page).to have_content('Orlando')
      expect(page).to have_content('Finding Nemo')
      expect(page).to_not have_content('Paramount')
      expect(page).to_not have_content('Star Wars')
      expect(page).to_not have_content('Lord of the Rings')
    end


  end
end