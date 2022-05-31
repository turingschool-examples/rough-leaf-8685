require 'rails_helper' 

RSpec.describe "Movie show page" do

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
    ActorMovie.create!(actor: @judy, movie: @oz)
    ActorMovie.create!(actor: @ray, movie: @oz)
    ActorMovie.create!(actor: @ray, movie: @melody)
  end

  it "displays the movie's title, creation year, genre" do
    visit "/movies/#{@seven.id}"
    
    expect(page).to have_content("Title: Seven Brides For Seven Brothers")
    expect(page).to have_content("Released: 1954")
    expect(page).to have_content("Genre: Musical")
    expect(page).to_not have_content("Title: Hit The Deck")
    expect(page).to_not have_content("Released: 1955")
    expect(page).to_not have_content("Title: The Wizard of Oz")
    expect(page).to_not have_content("Released: 1939")
  end

  it "displays list of all movies actors from youngest to oldest" do
    visit "/movies/#{@seven.id}"

    within("#actor-0") do
      expect(page).to have_content("Jane Powell")
      expect(page).to_not have_content("Howard Keel")
    end
    within("#actor-1") do
      expect(page).to have_content("Howard Keel")
      expect(page).to_not have_content("Jane Powell")
    end
    expect(page).to_not have_content("Judy Garland")
    expect(page).to_not have_content("Ann Miller")

    visit "/movies/#{@deck.id}"
  
    within("#actor-0") do
      expect(page).to have_content("Jane Powell")
      expect(page).to_not have_content("Ann Miller")
      expect(page).to_not have_content("Vic Damone")
    end
    within("#actor-1") do
      expect(page).to have_content("Vic Damone")
      expect(page).to_not have_content("Ann Miller")
      expect(page).to_not have_content("Jane Powell")
    end
    within("#actor-2") do
      expect(page).to have_content("Ann Miller")
      expect(page).to_not have_content("Jane Powell")
      expect(page).to_not have_content("Vic Damone")
    end
    expect(page).to_not have_content("Judy Garland")
    expect(page).to_not have_content("Howard Keel")
  end

  it "displays average age of all actors in the movie" do 
    visit "/movies/#{@deck.id}"

    expect(page).to have_content("Average age: 27.67")
    expect(page).to_not have_content("Average age: 26.5")
    
    visit "/movies/#{@seven.id}"
    
    expect(page).to have_content("Average age: 26.5")
    expect(page).to_not have_content("Average age: 27.67")
  end

  it "has a form to put an actors name to add to the movie" do
    visit "/movies/#{@deck.id}"

    fill_in("actor", with: "Debbie Reynolds")

    click_button "Add Actor to Movie"

    expect(current_path).to eq("/movies/#{@deck.id}")
    
    within("#actor-0") do
      expect(page).to have_content("Debbie Reynolds")
      expect(page).to_not have_content("Jane Powell")
    end
    expect(page).to have_content("Average age: 26.25")
    expect(page).to_not have_content("Average age: 27.67")
  end
end