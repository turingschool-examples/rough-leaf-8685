require 'rails_helper'

RSpec.describe 'Movie Show Page' do 
  let!(:studio2) { Studio.create(name: 'Studio Ghibli', location: 'Japan') }

  let!(:movie2) { studio2.movies.create(title: 'Spirited Away', creation_year: 2002, genre: 'Drama') }  

  describe 'user story 2' do 
    it 'has movie attributes' do 
      visit "movies/#{movie2.id}"

      expect(page).to have_content(movie2.title)
      expect(page).to have_content(movie2.creation_year)
      expect(page).to have_content(movie2.genre)
    end
  end
end