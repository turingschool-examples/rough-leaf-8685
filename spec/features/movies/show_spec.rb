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

  let!(:actor_movie1) { movie2.actor_movies.create!(actor_id: actor1.id) }
  let!(:actor_movie2) { movie2.actor_movies.create!(actor_id: actor2.id) }
  let!(:actor_movie3) { movie1.actor_movies.create!(actor_id: actor3.id) }

  it "displays the movie's attributes, movie titles, actors, and average afe of all actors for that movie" do
    visit movie_path(movie2)

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

  # And I see a form to add an actor to this movie
  # When I fill in the form with the name of an actor that exists in the database
  # And I click submit
  # Then I am redirected back to that movie's show page
  # And I see the actor's name is now listed
  # (You do not have to test for a sad path, for example if the name submitted is not an existing actor)
end
