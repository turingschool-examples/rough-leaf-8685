require 'rails_helper'

RSpec.describe 'Movies Show' do
  it 'shows the movies imformation on the show page for that movie' do
    studio_1 = Studio.create!(name: "Warner Bros", location: "Hollywood")
    movie_1 = Movie.create!(title: "Random film", creation_year: 2005, genre: "movie", studio_id: studio_1.id)
    mike = Actor.create!(name: "mike myers", age: 22)
    jim = Actor.create!(name: "jim carrey", age: 26)
    steve = Actor.create!(name: "steve harvey", age: 66)
    actor_movie_1 = ActorMovie.create!(actor_id: mike.id, movie_id: movie_1.id)
    actor_movie_2 = ActorMovie.create!(actor_id: jim.id, movie_id: movie_1.id)
    actor_movie_3 = ActorMovie.create!(actor_id: steve.id, movie_id: movie_1.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)
    expect(steve.name).to appear_before(jim.name)
    expect(jim.name).to appear_before(mike.name)
    expect(page).to have_content("38")
  end

  it 'does not show actors that are not in the movie currently shown' do
    studio_1 = Studio.create!(name: "Warner Bros", location: "Hollywood")
    movie_1 = Movie.create!(title: "Random film", creation_year: 2005, genre: "movie", studio_id: studio_1.id)
    movie_2 = Movie.create!(title: "another film", creation_year: 2006, genre: "movie", studio_id: studio_1.id)
    mike = Actor.create!(name: "mike myers", age: 22)
    jim = Actor.create!(name: "jim carrey", age: 26)
    steve = Actor.create!(name: "steve harvey", age: 66)
    actor_movie_1 = ActorMovie.create!(actor_id: mike.id, movie_id: movie_1.id)
    actor_movie_2 = ActorMovie.create!(actor_id: jim.id, movie_id: movie_1.id)
    actor_movie_3 = ActorMovie.create!(actor_id: steve.id, movie_id: movie_2.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to_not have_content(steve.name)
  end

  it 'has a link to add an actor to the film that takes you to actors/new' do
    studio_1 = Studio.create!(name: "Warner Bros", location: "Hollywood")
    movie_1 = Movie.create!(title: "Random film", creation_year: 2005, genre: "movie", studio_id: studio_1.id)
    movie_2 = Movie.create!(title: "another film", creation_year: 2006, genre: "movie", studio_id: studio_1.id)
    mike = Actor.create!(name: "mike myers", age: 22)
    jim = Actor.create!(name: "jim carrey", age: 26)
    steve = Actor.create!(name: "steve harvey", age: 66)
    actor_movie_1 = ActorMovie.create!(actor_id: mike.id, movie_id: movie_1.id)
    actor_movie_2 = ActorMovie.create!(actor_id: jim.id, movie_id: movie_1.id)
    actor_movie_3 = ActorMovie.create!(actor_id: steve.id, movie_id: movie_2.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_link("Add Actor to Movie")
    click_link "Add Actor to Movie"
    expect(current_path).to eq("/actors/new")
  end
end
