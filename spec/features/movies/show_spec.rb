require 'rails_helper'

RSpec.describe 'movie show page', type: :feature do
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
        @movie8 = @studio4.movies.create(title: "Another Warner Brothers Movie", creation_year: 2011, genre: "Romantic Comedy")
    
        @actor1 = Actor.create!(name: "Harrison Ford", age: 79)
        @actor2 = Actor.create!(name: "Mark Hamill", age: 70)
        @actor3 = Actor.create!(name: "Alec Guiness", age: 86)
        @actor4 = Actor.create!(name: "Carrie Fisher", age: 60)

        MovieActor.create(actor_id: @actor1.id, movie_id: @movie7.id)
        MovieActor.create(actor_id: @actor2.id, movie_id: @movie7.id)
        MovieActor.create(actor_id: @actor3.id, movie_id: @movie7.id)
        MovieActor.create(actor_id: @actor4.id, movie_id: @movie7.id)
    end
    it 'shows movie attributes' do
        visit "/movies/#{@movie7.id}"
        expect(page).to have_content(@movie7.title)
        expect(page).to have_content(@movie7.creation_date)
        expect(page).to have_content(@movie7.genre)
        expect(page).to_not have_content(@movie5.genre)
        expect(page).to_not have_content(@movie2.title)
        expect(page).to_not have_content(@movie1.creation_date)
    end

    it 'lists actor from youngest to oldest' do

    end

    it 'show average age of its actors' do

    end
end