# Movie Show
#
# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors

require 'rails_helper'

RSpec.describe 'movie show page' do
  let!(:studio1) { Studio.create!(name: 'Dark Castle Entertainment', location: 'Los Angeles, CA') }
  let!(:studio2) { Studio.create!(name: 'Pixar Animation', location: 'Emeryville, CA') }
  let!(:movie1) { studio1.movies.create!(title: 'Rock n Rolla', creation_year: 2008, genre: 'Action/Comedy') }
  let!(:movie2) { studio2.movies.create!(title: 'Monsters, Inc.', creation_year: 2001, genre: 'Animation') }
  let!(:movie3) { studio2.movies.create!(title: 'Up', creation_year: 2009, genre: 'Animation') }

  it "displays the studios attributes and movie titles" do
    visit movies_path(movie2)

    within "#movie-#{movie2}" do
      expect(page).to have_content('Title: Monsters, Inc.')
      expect(page).to have_content('Creation Year: 2001')
      expect(page).to have_content('Genre: Animation')
      expect(page).to_not have_content('Title: Rock n Rolla')
    end

    within "#movie-#{movie3}" do
      expect(page).to have_content('Title: Up')
      expect(page).to have_content('Creation Year: 2000')
      expect(page).to have_content('Genre: Animation')
      expect(page).to_not have_content('Monsters, Inc.')
    end

    expect(page).to_not have_content('Title: Rock n Rolla')
    expect(page).to_not have_content('Creation Year: 2008')
    expect(page).to_not have_content('Genre: Action/Comedy')
  end
end
