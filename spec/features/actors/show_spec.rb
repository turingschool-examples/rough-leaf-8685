require 'rails_helper'

RSpec.describe "Actor's Show page" do
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
    visit actor_path(actor1)
  end

# As a user,
# When I visit an actor's show page
# I see that actors name and age
# And I see a unique list of all of the actors this particular

  it "displays a unique list of all the actors this particular actor has worked with" do
    expect(page).to have_content('John Goodman')
    expect(page).to have_content('Age: 46')
    expect(page).to have_content('Eddie Murphey')
  end
end
