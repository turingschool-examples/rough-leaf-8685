require 'rails_helper'

RSpec.describe 'Studio Index Page' do

  let!(:studio1) { Studio.create(name: 'Warner Brothers Studios', location: 'Hollywood') }
  let!(:studio2) { Studio.create(name: 'Studio Ghibli', location: 'Japan') }
  let!(:studio3) { Studio.create(name: 'Paramount Pictures Studios', location: 'Hollywood') }

  let!(:movie1) { studio1.movies.create(title: '9', creation_year: 200, genre: 'Thriller') }
  let!(:movie2) { studio2.movies.create(title: 'Spirited Away', creation_year: 2002, genre: 'Drama') }
  let!(:movie3) { studio2.movies.create(title: 'Howls Moving Castle', creation_year: 2004, genre: 'Action/Adventure') }  
  let!(:movie4) { studio3.movies.create(title: 'Sonic the Hedgehog', creation_year: 2020, genre: 'Action/Adventure') }

  describe 'user story 1' do 
    it 'has each studios name and location' do 
      visit "/studios"
      
      within "#studio-#{studio1.id}" do 
        expect(page).to have_content(studio1.name)
        expect(page).to have_content(studio1.location)
        expect(page).to_not have_content(studio2.name)
      end

      within "#studio-#{studio2.id}" do
        expect(page).to have_content(studio2.name)
        expect(page).to have_content(studio2.location)
        expect(page).to_not have_content(studio3.name)
      end

      within "#studio-#{studio3.id}" do
        expect(page).to have_content(studio3.name)
        expect(page).to have_content(studio3.location)
        expect(page).to_not have_content(studio1.name)
      end 
    end

    it 'has the title of each movie under the studio' do 
      visit 'studios'

      within "#studio-#{studio1.id}" do 
        expect(page).to have_content(movie1.title)
        expect(page).to_not have_content(movie2.title)
      end

      within "#studio-#{studio2.id}" do
        expect(page).to have_content(movie2.title)
        expect(page).to have_content(movie3.title)
        expect(page).to_not have_content(movie4.title)
      end

      within "#studio-#{studio3.id}" do
        expect(page).to have_content(movie4.title)
        expect(page).to_not have_content(movie1.title)
      end 
    end
  end
end