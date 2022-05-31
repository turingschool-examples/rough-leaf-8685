require 'rails_helper'

RSpec.describe 'Studio Index Page' do

  let!(:studio1) { Studio.create(name: 'Warner Brothers Studios', location: 'Hollywood') }
  let!(:studio2) { Studio.create(name: 'Studio Ghibli', location: 'Japan') }
  let!(:studio3) { Studio.create(name: 'Paramount Pictures Studios', location: 'Hollywood') }

  let!(:movie1) { studio1.movies.create(title: '9', creation_year: 200, genre: 'Thriller') }
  let!(:movie1) { studio2.movies.create(title: 'Spirited Away', creation_year: 2002, genre: 'Drama') }
  let!(:movie1) { studio2.movies.create(title: 'Howls Moving Castle', creation_year: 2004, genre: 'Action/Adventure') }  
  let!(:movie1) { studio3.movies.create(title: 'Sonic the Hedgehog', creation_year: 2020, genre: 'Action/Adventure') }

  describe 'user story 1' do 
    it 'has each studios name and location' do 
      visit "/studios"
      
      expect(page).to have_content(studio1.name)
      expect(page).to have_content(studio1.location)

      expect(page).to have_content(studio2.name)
      expect(page).to have_content(studio2.location)

      expect(page).to have_content(studio3.name)
      expect(page).to have_content(studio3.location)
    end

    xit 'has the title of each movie under the studio' do 

    end
  end
end