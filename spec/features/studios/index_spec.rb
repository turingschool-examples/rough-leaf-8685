require 'rails_helper' 

RSpec.describe "Studio index page" do

  it "displays each studio's name, location, and movies titles" do
    mgm = Studio.create!(name: "Metro Goldwyn Mayer", location: "Hollywood")
    wb = Studio.create!(name: "Warner Borthers", location: "Los Angeles")
    
    seven = mgm.movies.create!(title: "Seven Brides For Seven Brothers", creation_year: 1954, genre: "musical")
    deck = mgm.movies.create!(title: "Hit The Deck", creation_year: 1955, genre: "musical")
    melody = wb.movies.create!(title: "The Broadway Melody", creation_year: 1929, genre: "musical")
    oz = wb.movies.create!(title: "The Wizard of Oz", creation_year: 1939, genre: "musical")
    
    visit "/studios"
    
    within("#studio-0") do
      expect(page).to have_content("Studio: Metro Goldwyn Mayer")
      expect(page).to have_content("Location: Hollywood")
      expect(page).to have_content("Movies: ")
      expect(page).to have_content("Seven Brides For Seven Brothers")
      expect(page).to have_content("Hit The Deck")
      expect(page).to_not have_content("Studio: Warner Borthers")
      expect(page).to_not have_content("Location: Los Angeles")
      expect(page).to_not have_content("The Broadway Melody")
      expect(page).to_not have_content("The Wizard of Oz")
    end
    within("#studio-1") do
      expect(page).to have_content("Studio: Warner Borthers")
      expect(page).to have_content("Location: Los Angeles")
      expect(page).to have_content("Movies: ")
      expect(page).to have_content("The Broadway Melody")
      expect(page).to have_content("The Wizard of Oz")
      expect(page).to_not have_content("Studio: Metro Goldwyn Mayer")
      expect(page).to_not have_content("Location: Hollywood")
      expect(page).to_not have_content("Seven Brides For Seven Brothers")
      expect(page).to_not have_content("Hit The Deck")
    end
  end
end