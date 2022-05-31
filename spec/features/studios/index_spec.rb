require 'rails_helper'

RSpec.describe 'studio index page' do
  let!(:studio1) { Studio.create!(name: 'Dark Castle Entertainment', location: 'Los Angeles, CA') }
  let!(:studio2) { Studio.create!(name: 'Pixar Animation', location: 'Emeryville, CA') }
  let!(:movie1) { studio1.movies.create!(title: 'Rock n Rolla', creation_year: 2008, genre: 'Action/Comedy') }
  let!(:movie2) { studio2.movies.create!(title: 'Monsters, Inc.', creation_year: 2001, genre: 'Animation') }

  it "displays the studios attributes and movie titles" do
    visit studios_path

    within "#studio-#{studio1.id}" do
      expect(page).to have_content('Dark Castle Entertainment')
      expect(page).to have_content('Location: Los Angeles, CA')
      expect(page).to_not have_content('Pixar Animation')
      expect('Location: Los Angeles, CA').to appear_before('Rock n Rolla')
    end

    within "#studio-#{studio2.id}" do
      expect(page).to have_content('Pixar Animation')
      expect(page).to have_content('Location: Emeryville, CA')
      expect(page).to_not have_content('Dark Castle Entertainment')
      expect('Location: Emeryville, CA').to appear_before('Monsters, Inc.')
    end
  end
end
