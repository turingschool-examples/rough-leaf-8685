require 'rails_helper'

RSpec.describe 'movie show page' do
  let!(:studio1) { Studio.create!(name: 'Dark Castle Entertainment', location: 'Los Angeles, CA') }
  let!(:studio2) { Studio.create!(name: 'Pixar Animation', location: 'Emeryville, CA') }

  let!(:movie1) { studio1.movies.create!(title: 'Rock n Rolla', creation_year: 2008, genre: 'Action/Comedy') }
  let!(:movie2) { studio2.movies.create!(title: 'Monsters, Inc.', creation_year: 2001, genre: 'Animation') }
  let!(:movie3) { studio2.movies.create!(title: 'Up', creation_year: 2009, genre: 'Animation') }

  let!(:actor1) { Actor.create!(name: 'John Goodman', age: 46) }
  let!(:actor2) { Actor.create!(name: 'Eddie Murphey', age: 55) }
  let!(:actor3) { Actor.create!(name: 'Brad Pitt', age: 50) }

  let!(:actor_movie1) { ActorMovie.create!(actor_id: actor1.id, movie_id: movie2.id) }
  let!(:actor_movie2) { ActorMovie.create!(actor_id: actor2.id, movie_id: movie2.id) }
  let!(:actor_movie3) { ActorMovie.create!(actor_id: actor3.id, movie_id: movie1.id) }

  before do
    visit movie_path(movie2)
  end

  it "displays the movie's attributes, movie titles, actors, and average afe of all actors for that movie" do
    expect(page).to have_content('Title: Monsters, Inc.')
    expect(page).to have_content('Creation Year: 2001')
    expect(page).to have_content('Genre: Animation')

    expect(page).to have_content('John Goodman')
    expect(page).to have_content('Eddie Murphey')
    expect(page).to_not have_content('Brad Pitt')

    expect('John Goodman').to appear_before('Eddie Murphey')
    expect(page).to have_content('Average Age of Actors: 50')

    expect(page).to_not have_content('Title: Up')
    expect(page).to_not have_content('Title: Rock n Rolla')
  end

  it "can submit a form to add an actor to that movie" do
    expect(page).to_not have_content('Brad Pitt')

    within ".add" do
      fill_in :name, with: 'Brad Pitt'
      click_on "Submit"
      expect(current_path).to eq(movie_path(movie2))
    end

    expect(page).to have_content('Brad Pitt')
  end

  it "can delete an actor from a movie" do
    expect(page).to have_content('John Goodman')

    within ".delete" do
      fill_in :name, with: 'John Goodman'
      click_on 'Submit'
      expect(current_path).to eq(movie_path(movie2))
    end

    expect(page).to_not have_content('John Goodman')
  end
end
