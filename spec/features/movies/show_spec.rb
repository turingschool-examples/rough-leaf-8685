require 'rails_helper'

RSpec.describe 'movie show page', type: :feature do

  it 'show page has title, creation year, genre, and lists all actors from oldest to youngest' do
    studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    studio2 = Studio.create!(name: "Warner Bros.", location: "Los Angeles")
    movie1 = studio1.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    movie2 = studio2.movies.create!(title: 'The Dark Knight', creation_year: 2008, genre: 'Action/Adventure')
    actor1 = Actor.create!(name: "Harrison Ford", age: 78)
    actor2 = Actor.create!(name: "Christian Bale", age: 48)
    actor3 = Actor.create!(name: "Michael Caine", age: 89)

    visit "/movies/#{movie2.id}"

    expect(page).to have_content("#{movie2.title}")
    expect(page).to have_content("creation year: #{movie2.creation_year}")
    expect(page).to have_content("genre: #{movie2.genre}")
    expect(page).to have_content("#{actor2.name}")
    expect(page).to have_content("#{actor3.name}")

  end
end
