require 'rails_helper'

RSpec.describe 'Movie Show Page' do
    before :each do
        @studio_1 = Studio.create!(name: 'G Studios', location: 'Los Angeles')
        @studio_2 = Studio.create!(name: 'Ocean Pictures', location: 'Miami')
        @studio_3 = Studio.create!(name: 'Disney', location: 'Orlando')
        @movie_1 = @studio_1.movies.create!(title: 'NWA', creation_year: 2015, genre: 'Musical')
        @movie_2 = @studio_1.movies.create!(title: 'Dark Souls', creation_year: 2020, genre: 'Documentary')
        @actor_1 = Actor.create!(name: 'Johnny', age: 50)
        @actor_2 = Actor.create!(name: 'Harrison', age: 60)
        @actor_3 = Actor.create!(name: 'Angie', age: 40)
        @actor_4 = Actor.create!(name: 'Sarah', age: 30)
        ActorMovie.create!(actor_id: @actor_1.id, movie_id: @movie_1.id)
        ActorMovie.create!(actor_id: @actor_2.id, movie_id: @movie_1.id)
        ActorMovie.create!(actor_id: @actor_3.id, movie_id: @movie_1.id)
        ActorMovie.create!(actor_id: @actor_4.id, movie_id: @movie_2.id)
    end
    it "displays movie title, year and genre" do
      visit "/movies/#{@movie_1.id}"
      expect(page).to have_content("Title: NWA")
      expect(page).to have_content("Year: 2015")
      expect(page).to have_content("Genre: Musical")
      expect(page).to_not have_content("Dark Souls")
      expect(page).to_not have_content("2020")
      expect(page).to_not have_content("Documentary")
    end

    it "lists actors youngest to oldest and displays average age" do
        visit "/movies/#{@movie_1.id}"
        expect("Angie").to appear_before("Johnny")
        expect("Johnny").to appear_before("Harrison")
        expect(page).to have_content("Average Age: 50") 
        expect(page).to_not have_content("Sarah") 
    end
    
    
end