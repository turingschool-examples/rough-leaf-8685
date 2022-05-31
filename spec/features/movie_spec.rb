require 'rails_helper'

RSpec.describe "movie show page" do
  before :each do
    @ford = Actor.create!(name: "Harrison Ford", age: 78)
    @allen = Actor.create!(name: "Karen Allen", age: 70)
    @lucas = Actor.create!(name: "George Lucas", age: 78)

    @univ = Studio.create!(name: "Universal Studios", location: "Hollywood")

    @movie1 = @univ.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: 'Action/Adventure')

    @actor_movie1 = ActorMovie.create!(actor_id: @for.id, movie_id: @allen.id)
  end

  it 'shows title, creation year, and genre' do
    visit "/movie/#{@movie1.id}"
    expect(page).to have_content("Raiders of the Lost Ark")
    expect(page).to have_content("1981")
    expect(page).to have_content("Action/Adventure")
  end

  it "shows actors from youngets to oldest" do
    expect(page).to have_content("Harrison Ford")
    expect(page).to have_content("George Lucas")
    expect(page).to have_content("Karen Allen")
    expect("Harrison Ford").to appear_before("Karen Allen")
  end

  it "shows average age of all of the actors" do
    expect(page).to have_content("Actor's Average Age: 75.33")
  end
end
