require 'rails_helper'

RSpec.describe 'Studios Index page' do

  it 'generates a list of each studios name and a list of all its movies' do
    studio_1 = Studio.create!(name: "Warner Bros", location: "Hollywood")
    movie_1 = Movie.create!(title: "Random film", creation_year: 2005, genre: "movie", studio_id: studio_1.id)

    visit "/studios"

    expect(page).to have_content("#{studio_1.name}")
  end
end
