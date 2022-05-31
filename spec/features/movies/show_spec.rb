require "rails_helper"

RSpec.describe 'Movies Show Page' do
  before :each do
    @studio_1 = Studio.create!(name: 'Paramount', location: "Hollywoo")
    @studio_2 = Studio.create!(name: 'Pixar', location: "Orlando")
    @sw = @studio_1.movies.create!(title: "Star Wars", creation_year: 1984, genre: "Sci-fi" )
    @lotr = @studio_1.movies.create!(title: "Lord of the Rings", creation_year: 2001, genre: "Fantasy" )
    @nemo = @studio_2.movies.create!(title: "Finding Nemo", creation_year: 2004, genre: "Animation" )
    @luke = @sw.actors.create!(name: "Mark Hamill", age: 53)
    @han = @sw.actors.create!(name: "Harrison Ford", age: 62)
    @leia = @sw.actors.create!(name: "Carrie Fisher", age: 58)
  end

  it 'displays the movies title, creation year, genre, a list of actors from youngest to oldest and an average ag of the movies actors' do
    visit "movies/#{@sw.id}"

    expect(page).to have_content("Star Wars")
    expect(page).to have_content(1984)
    expect(page).to have_content("Sci-fi")
    expect("").to appear_before("")
    expect("").to appear_before("")
    expect("").to appear_before("")
    expect(page).to have_content("Average age amoungst Actors: 57.67")
  end
end