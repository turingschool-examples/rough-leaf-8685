require 'rails_helper'

RSpec.describe 'Actor Show Page' do
    before :each do
        @studio_1 = Studio.create!(name: 'G Studios', location: 'Los Angeles')
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

    it "displays actors name, age and coactors from previous films" do
        visit "/actors/#{@actor_1.id}"
        expect(page).to have_content("Name: Johnny")
        expect(page).to have_content("Age: 50")
        within "#coactors" do
            expect(page).to have_content("Harrison")
            expect(page).to have_content("Angie")
            expect(page).to_not have_content("Sarah")
            expect(page).to_not have_content("Johnny")
        end
    end
    

end