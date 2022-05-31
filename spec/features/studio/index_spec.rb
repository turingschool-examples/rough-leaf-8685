require 'rails_helper'

RSpec.describe 'Studio Index Page' do
    it "displays each studios name and their movies" do
        studio_1 = Studio.create!(name: 'G Studios', location: 'Los Angeles')
        studio_2 = Studio.create!(name: 'Ocean Pictures', location: 'Miami')
        studio_3 = Studio.create!(name: 'Disney', location: 'Orlando')
        movie_1 = studio_1.movies.create!(title: 'NWA', creation_year: 2015, genre: 'Musical')
        movie_2 = studio_1.movies.create!(title: 'Dark Souls', creation_year: 2020, genre: 'Documentary')
        movie_3 = studio_2.movies.create!(title: 'Toy Story', creation_year: 2005, genre: 'Cartoon')
        movie_4 = studio_2.movies.create!(title: 'Narwhal Adventures', creation_year: 2000, genre: 'Adventure')
        movie_5 = studio_3.movies.create!(title: 'Princess Joker', creation_year: 2018, genre: 'Fairy')
        movie_6 = studio_3.movies.create!(title: 'LaLaLa', creation_year: 2020, genre: 'Musical')

        visit "/studios"
        within "#studio-#{studio_1.id}" do
            expect(page).to have_content("Name: G Studios")
            expect(page).to have_content("Location: Los Angeles")
            expect(page).to have_content("NWA")
            expect(page).to have_content("Dark Souls")
        end
        within "#studio-#{studio_2.id}" do
            expect(page).to have_content("Name: Ocean Pictures")
            expect(page).to have_content("Location: Miami")
            expect(page).to have_content("Toy Story")
            expect(page).to have_content("Narwhal Adventures")
        end
        within "#studio-#{studio_3.id}" do
            expect(page).to have_content("Name: Disney")
            expect(page).to have_content("Location: Orlando")
            expect(page).to have_content("Princess Joker")
            expect(page).to have_content("LaLaLa")
        end
    end
    
end