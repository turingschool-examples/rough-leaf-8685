require 'rails_helper'

RSpec.describe 'movies show page' do
  it 'shows the movie title, creation year, and genre' do
    marvel = Studio.create!(name: 'Marvel', location: 'Denver, CO')

    iron_man = marvel.movies.create!(title: 'Iron Man', creation_year: '2008', genre: 'Action')
    captain_america = marvel.movies.create!(title: 'Captain America', creation_year: '2010', genre: 'Action')
    thor = marvel.movies.create!(title: 'Thor', creation_year: '2011', genre: 'Action')

    visit "/movies/#{iron_man.id}"

    expect(page).to have_content('Iron Man')
    expect(page).to have_content('2008')
    expect(page).to have_content('Action')
  end
end
