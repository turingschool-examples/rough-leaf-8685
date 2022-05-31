require 'rails_helper'

RSpec.describe 'studios index page' do
  it 'shows studio name and location, with movie titles underneath' do
    marvel = Studio.create!(name: 'Marvel', location: 'Denver, CO')
    disney = Studio.create!(name: 'Disney', location: 'Tampa, FL')

    iron_man = marvel.movies.create!(title: 'Iron Man', creation_year: '2008', genre: 'Action')
    captain_america = marvel.movies.create!(title: 'Captain America', creation_year: '2010', genre: 'Action')
    thor = marvel.movies.create!(title: 'Thor', creation_year: '2011', genre: 'Action')

    aladdin = disney.movies.create!(title: 'Alladin', creation_year: '2003', genre: 'Fantasy')
    pocohontas = disney.movies.create!(title: 'Pocohontas', creation_year: '2001', genre: 'Fantasy')
    tangled = disney.movies.create!(title: 'Tangled', creation_year: '2012', genre: 'Fantasy')

    visit '/studios'

    within("div##{marvel.id}") do
      expect('Marvel').to appear_before('Denver, CO')
      expect('Denver, CO').to appear_before('Iron Man')
      expect(page).to have_content('Captain America')
      expect(page).to have_content('Thor')
      expect(page).to_not have_content('Disney')
      expect(page).to_not have_content('Tampa, FL')
      expect(page).to_not have_content('Alladin')
      expect(page).to_not have_content('Pocohontas')
      expect(page).to_not have_content('Tangled')
    end

    within("div##{disney.id}") do
      expect('Disney').to appear_before('Tampa, FL')
      expect('Tampa, FL').to appear_before('Alladin')
      expect(page).to_not have_content('Captain America')
      expect(page).to_not have_content('Thor')
      expect(page).to have_content('Disney')
      expect(page).to have_content('Tampa, FL')
      expect(page).to have_content('Alladin')
      expect(page).to have_content('Pocohontas')
      expect(page).to have_content('Tangled')
    end
  end
end
