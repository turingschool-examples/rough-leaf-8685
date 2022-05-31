require 'rails_helper'

RSpec.describe 'Studio Index Page' do
  it 'lists each studio name, location, and movie titles' do
    studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    studio2 = Studio.create!(name: 'Pixar', location: 'Emeryville')
    movie1 = studio1.movies.create!(title: 'Tomato', creation_year: 1992)
    movie2 = studio1.movies.create!(title: 'Potato', creation_year: 1993)
    movie3 = studio2.movies.create!(title: 'Pinapple', creation_year: 1994)
    movie4 = studio2.movies.create!(title: 'Coconut', creation_year: 1995)

    visit '/studios'

    within('#studio-0') do
      expect(page).to have_content('Universal Studios')
      expect(page).to have_content('Hollywood')
      expect(page).to have_content('Tomato')
      expect(page).to have_content('Potato')
      expect(page).to_not have_content('Pineapple')
      expect(page).to_not have_content('Pixar')
    end

    within('#studio-1') do
      expect(page).to have_content('Pixar')
      expect(page).to have_content('Emeryville')
      expect(page).to have_content('Pineapple')
      expect(page).to have_content('Coconut')
      expect(page).to_not have_content('Universal Studios')
      expect(page).to_not have_content('Tomato')
    end
  end
end
