require 'rails_helper'

RSpec.describe 'Movies Show' do
  it 'shows the movies imformation on the show page for that movie' do
    studio_1 = Studio.create!(name: "Warner Bros", location: "Hollywood")
    movie_1 = Movie.create!(title: "Random film", creation_year: 2005, genre: "movie", studio_id: studio_1.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)
  end
end
