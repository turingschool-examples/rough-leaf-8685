require 'rails_helper'

describe 'movie show page' do
  before do
    @marvel = Studio.create!(name: "Marvel Studios", location: "Burbank")

    @spider = @marvel.movies.create!(title: "Spider-Man", creation_year: 2021, genre: "action")
    @thor = @marvel.movies.create!(title: "Thor", creation_year: 2017, genre: "action")
    @iron = @marvel.movies.create!(title: "Iron Man", creation_year: 2013, genre: "action")

    @tom = Actor.create!(name: "Tom Holland", age: 25)
    @rob = Actor.create!(name: "Robert Downey Jr", age: 57)
    @chris = Actor.create!(name: "Chris Hemsworth", age: 38)

    ActorMovie.create!(movie: @spider, actor: @tom)
    ActorMovie.create!(movie: @spider, actor: @rob)
    ActorMovie.create!(movie: @thor, actor: @chris)
    ActorMovie.create!(movie: @iron, actor: @rob)
  end

  it "displays the movies title, creation year, and genre" do
    visit "/movies/#{@spider.id}"

    expect(page).to have_content("Spider-Man")
    expect(page).to_not have_content("Thor")
    expect(page).to_not have_content("Iron Man")
    expect(page).to have_content(2021)
    expect(page).to have_content("action")

    visit "/movies/#{@iron.id}"

    expect(page).to have_content("Iron Man")
    expect(page).to_not have_content("Spider-Man")
    expect(page).to_not have_content("Thor")
    expect(page).to have_content(2013)
    expect(page).to have_content("action")
  end
end
