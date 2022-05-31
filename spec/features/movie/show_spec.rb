require 'rails_helper'

RSpec.describe 'movie show page' do 
  let!(:studio1) { Studio.create!(name: "Universal Studios", location: "Hollywood") }

  let!(:movie1) { studio1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure") }
  let!(:movie2) { studio1.movies.create!(title: "The Croods: A New Age" , creation_year:  2020, genre: "Family") }

  let!(:actor1) { movie1.actors.create!(name: "Handsome Sam" , age: 33) }
  let!(:actor2) { movie1.actors.create!(name: "Villian Dan", age: 25) }
  let!(:actor3) { movie1.actors.create!(name: "Dame Deloris", age: 22) }

  it 'show movie title, creation year and genre' do 
    visit "/movies/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.creation_year)
    expect(page).to have_content(movie1.genre)
    
    expect(page).to_not have_content(movie2.title)
    expect(page).to_not have_content(movie2.creation_year)
    expect(page).to_not have_content(movie2.genre)
  end

  it 'lists all actors from youngest to oldest' do 
    visit "/movies/#{movie1.id}"

    expect(actor3.name).to appear_before(actor2.name)
    expect(actor2.name).to appear_before(actor1.name)
  end

  it 'shows movies actors average age' do 
    visit "/movies/#{movie1.id}"

    expect(page).to have_content("Average Age: 26.67")
  end
end