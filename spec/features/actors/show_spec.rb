require 'rails_helper' 

RSpec.describe "actor show page" do

  before :each do
    @mgm = Studio.create!(name: "Metro Goldwyn Mayer", location: "Hollywood")
    @wb = Studio.create!(name: "Warner Borthers", location: "Los Angeles")
    
    @seven = @mgm.movies.create!(title: "Seven Brides For Seven Brothers", creation_year: 1954, genre: "Musical")
    @deck = @mgm.movies.create!(title: "Hit The Deck", creation_year: 1955, genre: "Musical")
    @melody = @wb.movies.create!(title: "The Broadway Melody of 1940", creation_year: 1940, genre: "Musical")
    @oz = @wb.movies.create!(title: "The Wizard of Oz", creation_year: 1939, genre: "Musical")
    
    @jane = Actor.create!(name: "Jane Powell", age: 23)
    @vic = Actor.create!(name: "Vic Damone", age: 25)
    @ann = Actor.create!(name: "Ann Miller", age: 35)
    @howard = Actor.create!(name: "Howard Keel", age: 30)
    @judy = Actor.create!(name: "Judy Garland", age: 28)
    @ray = Actor.create!(name: "Ray Bolger", age: 38)
    @debbie = Actor.create!(name: "Debbie Reynolds", age: 22) 
    
    ActorMovie.create!(actor: @jane, movie: @seven)
    ActorMovie.create!(actor: @jane, movie: @deck)
    ActorMovie.create!(actor: @vic, movie: @deck)
    ActorMovie.create!(actor: @ann, movie: @deck)
    ActorMovie.create!(actor: @howard, movie: @seven)
    ActorMovie.create!(actor: @howard, movie: @deck)
    ActorMovie.create!(actor: @judy, movie: @oz)
    ActorMovie.create!(actor: @ray, movie: @oz)
    ActorMovie.create!(actor: @ray, movie: @melody)
  end

  it "displays actors name, age and list of coactors" do
    visit "actors/#{@jane.id}"

    expect(page).to have_content("Jane Powell")
    expect(page).to have_content("Age: 23")
    expect(page).to have_content("Coactors:")
    expect(page).to have_content("Howard Keel")
    expect(page).to have_content("Ann Miller")
    expect(page).to have_content("Vic Damone")
    
    expect(page).to_not have_content("Judy Garland")
    expect(page).to_not have_content("Ray Bolger")
    expect(page).to_not have_content("Debbie Reynolds")
  end

end