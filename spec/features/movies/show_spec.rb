require 'rails_helper'

RSpec.describe 'movies show page', type: :feature do
  before :each do
    @uni = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @dis = Studio.create!(name: "Disney", location: "Florida")
    @sw = @dis.movies.create!(title: "Star Wars", creation_year: "1984", genre: "Sci-Fi/Adventure")
    @moana = @dis.movies.create!(title: "Moana", creation_year: "2020", genre: "Family/Adventure")
    @die = @uni.movies.create!(title: "Die Hard", creation_year: "1989", genre: "Action")
    @bond = @uni.movies.create!(title: "007", creation_year: "2007", genre: "Action/Spy")
    @hf = @sw.actors.create!(name: "Harrison Ford", age: "78")
    @gl = @sw.actors.create!(name: "George Lucas", age: "65")
    @ag = @sw.actors.create!(name: "Alec Guinness", age: "90")
    @np = @sw.actors.create!(name: "Natalie Portman", age: "39")

  end

  it 'shows the movie title, creation year, and genre' do

    visit "/movies/#{@sw.id}"

    expect(page).to have_content("Star Wars")
    expect(page).to have_content("1984")
    expect(page).to have_content("Sci-Fi/Adventure")
    expect(page).to_not have_content("Moana")
    expect(page).to_not have_content("Die Hard")
  end
#   As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,

  it 'shows a list of its actors from youngest to oldest and the average age of all actors' do

    visit "/movies/#{@sw.id}"

    expect(page).to have_content("Harrison Ford")
    expect(page).to have content("78")
    expect("Natalie Portman").to appear_before("George Lucas")
    expect("George Lucas").to appear_before("Harrison Ford")
    expect("Harrison Ford").to appear_before("Alec Guinness")
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
  end
end
