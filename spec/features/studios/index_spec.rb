require 'rails_helper'

RSpec.describe Studio, type: :feature do
  describe '#index' do
    it 'display each studios information and movies associated with each' do
      studio1 = Studio.create!(name: 'Paramount', location: 'Hollywood')
      studio2 = Studio.create!(name: 'Universal', location: 'Houston')
      movie1 = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure',
                             studio_id: studio1.id)
      movie2 = Movie.create!(title: 'Fast 5', creation_year: 2011, genre: 'Action/Adventure', studio_id: studio2.id)

      visit studios_path

      within "#studio-#{studio1.id}" do
        expect(page).to have_content(studio1.name)
        expect(page).to have_content(studio1.location)
        expect(page).to have_content(movie1.title)
      end

      within "#studio-#{studio2.id}" do
        expect(page).to have_content(studio2.name)
        expect(page).to have_content(studio2.location)
        expect(page).to have_content(movie2.title)
      end
    end
  end
end
