require 'rails_helper'

RSpec.describe "Actors Show" do
  it "displays attributes" do
    studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

    movie_1 = studio_1.movies.create!(title: "Cool Movie", creation_year: 1986, genre: "Superhero")

    actor_1 = Actor.create!(name: "Billy Bob Thorton", age: 69)
    actor_2 = Actor.create!(name: "Allison Brie", age: 44)
    actor_3 = Actor.create!(name: "John Belushi", age: 22)

    act_movie_1 = ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
    act_movie_2 = ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)

    visit "/actors/#{actor_1.id}"

    expect(page).to have_content("Name: Billy Bob Thorton")
    expect(page).to have_content("Age: 69")
    expect(page).to_not have_content("Age: 44")
  end

  xit "shows unique coactors" do
    studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

    movie_1 = studio_1.movies.create!(title: "Cool Movie", creation_year: 1986, genre: "Superhero")

    actor_1 = Actor.create!(name: "Billy Bob Thorton", age: 69)
    actor_2 = Actor.create!(name: "Allison Brie", age: 44)
    actor_3 = Actor.create!(name: "John Belushi", age: 22)

    act_movie_1 = ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
    act_movie_2 = ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)

    visit "/actors/#{actor_1.id}"

    expect(page).to have_content("Coactors: Allison Brie")
    expect(page).to_not have_content("John Belushi")
  end
end
