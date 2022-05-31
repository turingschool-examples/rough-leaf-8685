require 'rails_helper'

RSpec.describe 'studio index page' do
  let!(:studio1) { Studio.create!(name: 'Dark Castle Entertainment', location: 'Los Angeles, CA') }
  let!(:studio2) { Studio.create!(name: 'Pixar Animation', location: 'Emeryville, CA') }
  let!(:movie1) { studio1.movies.create!(title: 'Rock n Rolla', creation_year: 2008, genre: 'Action/Comedy') }
  let!(:movie2) { studio2.movies.create!(title: 'Monsters, Inc.', creation_year: 2001, genre: 'Animation') }

  it "shows the studios attributes and movie titles" do
    visit studios_path

    within "#studio-#{studio1}" do
      expect(page).to have_content('Name: Dark Castle Entertainment')
      expect(page).to have_content('Location: Los Angeles, CA')
      expect(page).to_not have_content('Name: Pixar Animation')
      expect('Rock n Rolla').to appear_after('Location: Los Angeles, CA')
    end

    within "#studio-#{studio2}" do
      expect(page).to have_content('Name: Pixar Animation')
      expect(page).to have_content('Location: Emeryville, CA')
      expect(page).to_not have_content('Name: Dark Castle Entertainment')
      expect('Monsters, Inc.').to appear_after('Location: Emeryville, CA')
    end
  end
end

# As a user,
# When I visit the studio index page
# I see a each studio's name and location
# And underneath each studio, I see the titles of all of its movies.
