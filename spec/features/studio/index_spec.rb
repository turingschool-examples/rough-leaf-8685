require 'rails_helper'

RSpec.describe 'studio index', type: :feature do
  before(:each) do
    @studio1 = Studio.create!(name: "Universal", location: "Hollywood")
    @studio2 = Studio.create!(name: "MGM", location: "Beverly Hills")
    @studio3 = Studio.create!(name: "Disney", location: "Burbank")
    @studio4 = Studio.create!(name: "Warner Brothers", location: "Burbank")
    
    
    @movie1 = @studio1.movies.create(title: "Universal Movie", creation_year: 2000, genre: "Action/Adventure")
    @movie2 = @studio1.movies.create(title: "Another Universal Movie", creation_year: 2001, genre: "Horror")
    @movie3 = @studio2.movies.create(title: "MGM Movie", creation_year: 2001, genre: "Thriller")
    @movie4 = @studio2.movies.create(title: "Another MGM Movie", creation_year: 1980, genre: "Drama")
    @movie5 = @studio3.movies.create(title: "Disney Movie", creation_year: 2005, genre: "Comedy")
    @movie6 = @studio3.movies.create(title: "Another Disney Movie", creation_year: 1993, genre: "Animated")
    @movie7 = @studio4.movies.create(title: "Warner Brothers Movie", creation_year: 2020, genre: "Documentary")
    @movie7 = @studio4.movies.create(title: "Another Warner Brothers Movie", creation_year: 2011, genre: "Romantic Comedy")
  end

  it "displays all studios and their movies" do
    visit "/studios"

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio2.name)
    expect(page).to have_content(@studio3.name)
    expect(page).to have_content(@studio4.name)
    within "#studio-0" do
        save_and_open_page
      expect(page).to_not have_content("MGM Movie")
      expect(page).to have_content("Universal Movie")
    end
  end

end