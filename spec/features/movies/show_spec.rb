require 'rails_helper'

RSpec.describe "Movie Show" do
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

    @movie_1 = @studio_1.movies.create!(title: "Cool Movie", creation_year: 1986, genre: "Superhero")
    @movie_2 = @studio_1.movies.create!(title: "Bad Movie", creation_year: 1988, genre: "Horror")

    @actor_1 = Actor.create!(name: "Billy Bob Thorton", age: 69)
    @actor_2 = Actor.create!(name: "Allison Brie", age: 44)
    @actor_3 = Actor.create!(name: "John Belushi", age: 22)

    @act_movie_1 = ActorMovie.create!(actor_id: @actor_1.id, movie_id: @movie_1.id)
    @act_movie_2 = ActorMovie.create!(actor_id: @actor_2.id, movie_id: @movie_1.id)
    @act_movie_3 = ActorMovie.create!(actor_id: @actor_3.id, movie_id: @movie_2.id)
  end

  it "displays a Movie's attributes" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content("Title: Cool Movie")
    expect(page).to have_content("Created: 1986")
    expect(page).to have_content("Genre: Superhero")
    expect(page).to_not have_content("Title: Bad Movie")
    expect(page).to_not have_content("Created: 1988")
    expect(page).to_not have_content("Genre: Horror")
  end

  it "has a list of all actors in the movie" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content("All Actors: ")
    expect(page).to have_content("Billy Bob Thorton")
    expect(page).to have_content("Allison Brie")
    expect(page).to_not have_content("John Belushi")
  end

  it "displays the average age of the actors" do
    visit "/movies/#{@movie_1.id}"

    expect(page).to have_content("Average Actor Age: 56.5")
  end
end
