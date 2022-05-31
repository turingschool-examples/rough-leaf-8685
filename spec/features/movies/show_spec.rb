# As a user,
# When I visit a movie's show page.
# I see the movie's title, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors


# Add an Actor to a Movie
#
# As a user,
# When I visit a movie show page,
# I do not see any actors listed that are not part of the movie
# And I see a form to add an actor to this movie
# When I fill in the form with the name of an actor that exists in the database
# And I click submit
# Then I am redirected back to that movie's show page
# And I see the actor's name is now listed
# (You do not have to test for a sad path, for example if the name submitted is not an existing actor)

require 'rails_helper'

RSpec.describe 'movie show page' do
  let!(:studio1) { Studio.create!(name: 'Dark Castle Entertainment', location: 'Los Angeles, CA') }
  let!(:studio2) { Studio.create!(name: 'Pixar Animation', location: 'Emeryville, CA') }

  let!(:movie1) { studio1.movies.create!(title: 'Rock n Rolla', creation_year: 2008, genre: 'Action/Comedy') }
  let!(:movie2) { studio2.movies.create!(title: 'Monsters, Inc.', creation_year: 2001, genre: 'Animation') }
  let!(:movie3) { studio2.movies.create!(title: 'Up', creation_year: 2009, genre: 'Animation') }

  let!(:actor1) { Actor.create!(name: 'John Goodman', age: 46) }
  let!(:actor2) { Actor.create!(name: 'Eddie Murphey', age: 55) }

  let!(:actor_movie1) { movie2.actor_movies.create!(actor_id: actor1.id) }
  let!(:actor_movie2) { movie2.actor_movies.create!(actor_id: actor2.id) }

  it "displays the movie's attributes, movie titles, actors, and average afe of all actors for that movie" do
    visit movie_path(movie2)

      expect(page).to have_content('Title: Monsters, Inc.')
      expect(page).to have_content('Creation Year: 2001')
      expect(page).to have_content('Genre: Animation')
      expect(page).to_not have_content('Title: Rock n Rolla')

      expect(page).to have_content('John Goodman')
      expect(page).to have_content('Eddie Murphey')
  end
end


# expect(page).to have_content('Title: Up')
# expect(page).to have_content('Creation Year: 2000')
# expect(page).to have_content('Genre: Animation')
# expect(page).to_not have_content('Monsters, Inc.')
#
# expect(page).to_not have_content('Title: Rock n Rolla')
# expect(page).to_not have_content('Creation Year: 2008')
# expect(page).to_not have_content('Genre: Action/Comedy')
