require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before :each do
    @studio_1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

    @star_wars = @studio_1.movies.create!(title: "Star Wars", creation_year: "1991", genre: "Fantasy")
    @how_high = @studio_1.movies.create!(title: "How High", creation_year: "1994", genre: "comedy")

    @ford = Actor.create!(name: "Harrison Ford", age: 80)
    @portman = Actor.create!(name: "Natalie Portman", age: 40)
    @chappelle = Actor.create!(name: "Dave Chappelle", age: 62)

    @movieactor_1 = MovieActor.create!(movie_id: @star_wars.id, actor_id: @ford.id)
    @movieactor_2 = MovieActor.create!(movie_id: @star_wars.id, actor_id: @portman.id)
  end

  it "shows movie title, year, and genre" do
    visit "/movies/#{@star_wars.id}"
    expect(page).to have_content("Star Wars")
    expect(page).to have_content("Creation Year: 1991")
    expect(page).to have_content("Genre: Fantasy")

    expect(page).to_not have_content("Name: How High")
  end

  it "shows all actors that are in a movie in age order" do
    visit "/movies/#{@star_wars.id}"
    expect(page).to have_content("Actors in this Movie:")
    expect(page).to have_content("Harrison Ford")
    expect(page).to have_content("Natalie Portman")

    expect(@portman.name).to appear_before(@ford.name)

    expect(page).to_not have_content("Dave Chappelle")
  end

  it "gives average age of all actors in a movie" do
    visit "/movies/#{@star_wars.id}"
    expect(page).to have_content("Average Age of Actors in this Movie: 60")
  end

  it "can add an actor to a movie via a form" do
    visit "/movies/#{@star_wars.id}"

    expect(page).to_not have_content("Dave Chappelle")
    fill_in :name, with: "Dave Chappelle"
    click_on("Add Actor to this Movie")

    expect(current_path).to eq("/movies/#{@star_wars.id}")
    expect(page).to have_content("Dave Chappelle")
  end



end
