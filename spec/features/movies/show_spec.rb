require 'rails_helper'

RSpec.describe "Movie", type: :feature do
  describe "movie show" do
    it 'lists movie title creation year genre list of all actors and average age' do

      # paramount = Studio.create!(name: "Paramount", location: 'Burbank, CA')
      tyler = Studio.create!(name: "Perry Studios", location: 'Atlanta, GA')
      # top_gun = Movie.create!(title: "Top Gun", creation_year: 2020, genre: "action", studio_id: paramount.id)
      # die_harder = Movie.create!(title: "Die Hard 46", creation_year: 1998, genre: "action", studio_id: tyler.id)
      madea = Movie.create!(title: "Madea", creation_year: 2010, genre: "comedy", studio_id: tyler.id)
      tom = Actor.create!(name: "Tom Cruise", age: 50)
      arnold = Actor.create!(name: "Arnold", age: 73)
      MovieActor.create!(movie_id: madea.id, actor_id: tom.id)
      MovieActor.create!(movie_id: madea.id, actor_id: arnold.id)

      visit "/movies/#{madea.id}"
save_and_open_page
      expect(page).to have_content("Madea")
      expect(page).to have_content("2010")
      expect(page).to have_content("comedy")
      expect("Tom Cruise").to appear_before("Arnold")
      expect(page).to have("Average Age: 61.5")
    end
  end
end
