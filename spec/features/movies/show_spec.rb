require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  it 'lists movie attributes' do
    studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie1 = studio1.movies.create!(title: 'Tomato', creation_year: 1992, genre: 'Horror')
    movie2 = studio1.movies.create!(title: 'Potato', creation_year: 1993, genre: 'Comedy')
    visit "/movies/#{movie1.id}"
    expect(page).to have_content('Tomato')
    expect(page).to have_content('Horror')
    expect(page).to have_content('1992')
    expect(page).to_not have_content('Potato')
    expect(page).to_not have_content('Comedy')
    expect(page).to_not have_content('1993')
  end

  it 'lists actors by age and show average actor age' do
    studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie1 = studio1.movies.create!(title: 'Tomato', creation_year: 1992, genre: 'Horror')
    actor1 = Actor.create!(name: 'Apple', age: 27)
    actor2 = Actor.create!(name: 'Kiwi', age: 43)
    actor3 = Actor.create!(name: 'Blueberry', age: 29)
    actor4 = Actor.create!(name: 'Strawberry', age: 31)
    MovieActor.create!(movie: movie1, actor: actor1)
    MovieActor.create!(movie: movie1, actor: actor2)
    MovieActor.create!(movie: movie1, actor: actor3)
    visit "/movies/#{movie1.id}"
    expect(page).to have_content('Apple')
    expect(page).to have_content('Kiwi')
    expect(page).to have_content('Blueberry')
    expect(page).to_not have_content('Strawberry')
    expect(page).to have_content('33')
  end

  xit 'has form for adding an actor to the movie' do
    studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie1 = studio1.movies.create!(title: 'Tomato', creation_year: 1992, genre: 'Horror')
    actor1 = Actor.create!(name: 'Apple', age: 27)
    actor2 = Actor.create!(name: 'Kiwi', age: 43)
    actor3 = Actor.create!(name: 'Blueberry', age: 29)
    actor4 = Actor.create!(name: 'Strawberry', age: 31)
    MovieActor.create!(movie: movie1, actor: actor1)
    MovieActor.create!(movie: movie1, actor: actor2)
    MovieActor.create!(movie: movie1, actor: actor3)
    visit "/movies/#{movie1.id}"
    expect(page).to_not have_content('Strawberry')
    fill_in 'Add actor to movie:', with: 'Strawberry'
    click_on 'Submit'
    expect(current_path).to eq("/movies/#{movie1.id}")
    expect(page).to have_content('Strawberry')
  end
end
