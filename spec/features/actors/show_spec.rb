require 'rails_helper'

describe 'actor show page' do
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
    ActorMovie.create!(movie: @iron, actor: @rob)
    ActorMovie.create!(movie: @iron, actor: @gwen)
  end

  it "lists the actors name and age" do
    visit "/actors/#{@tom.id}"
    save_and_open_page
    within "#actor-info" do
      expect(page).to have_content("Tom Holland")
      expect(page).to_not have_content("Chris Hemsworth")

      expect(page).to have_content(25)
    end

  end

  it 'lists this actors co-actors' do
    ActorMovie.create!(movie: @thor, actor: @chris)
    ActorMovie.create!(movie: @thor, actor: @tom)

    visit "/actors/#{@tom.id}"
    within "#co-actors" do
      expect(page).to have_content("Robert Downey Jr")
      expect(page).to have_content("Chris Hemsworth")
      expect(page).to_not have_content("Gwyneth Paltrow")
      expect(page).to_not have_content("Tom Holland")
    end

  end
end
