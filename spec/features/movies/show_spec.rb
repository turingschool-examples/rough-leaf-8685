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
    @gwen = Actor.create!(name: "Gwyneth Paltrow", age: 49)

    ActorMovie.create!(movie: @spider, actor: @tom)
    ActorMovie.create!(movie: @spider, actor: @rob)
    ActorMovie.create!(movie: @spider, actor: @chris)
    ActorMovie.create!(movie: @iron, actor: @tom)
    ActorMovie.create!(movie: @iron, actor: @rob)
    ActorMovie.create!(movie: @iron, actor: @gwen)
  end

  it "displays the movies title, creation year, and genre" do
    visit "/movies/#{@spider.id}"

    within "#movie-info" do
      expect(page).to have_content("Spider-Man")
      expect(page).to_not have_content("Thor")
      expect(page).to_not have_content("Iron Man")
      expect(page).to have_content(2021)
      expect(page).to have_content("Action")
    end

    visit "/movies/#{@iron.id}"

    within "#movie-info" do
      expect(page).to have_content("Iron Man")
      expect(page).to_not have_content("Spider-Man")
      expect(page).to_not have_content("Thor")
      expect(page).to have_content(2013)
      expect(page).to have_content("Action")
    end
  end

  it 'lists all of its actors from oldest to youngest' do
    visit "/movies/#{@spider.id}"

    within "#movie-actors" do
      expect("Tom Holland").to appear_before("Chris Hemsworth")
      expect("Chris Hemsworth").to appear_before("Robert Downey Jr")
    end

    visit "/movies/#{@iron.id}"

    within "#movie-actors" do
      expect("Tom Holland").to appear_before("Gwyneth Paltrow")
      expect("Gwyneth Paltrow").to appear_before("Robert Downey Jr")
    end
  end

  it "displays the average age of all the actors" do
    visit "/movies/#{@spider.id}"

    within "#actor-stats" do
      expect(page).to have_content("Average Actor Age: 40 years old")
    end

    visit "/movies/#{@iron.id}"

    within "#actor-stats" do
      expect(page).to have_content("Average Actor Age: 44 years old")
    end
  end

  it 'can add an actor the the movie by name' do
    visit "/movies/#{@spider.id}"
    
    within "#movie-actors" do
      expect(page).to_not have_content("Gwyneth Paltrow")
    end

    within '#add-actor' do
      fill_in "Actor Name", with: "Gwyneth Paltrow"
      click_button "Add Actor to Movie"
    end

    expect(current_path).to eq("/movies/#{@spider.id}")

    within "#movie-actors" do
      expect(page).to have_content("Gwyneth Paltrow")
    end

  end

end
