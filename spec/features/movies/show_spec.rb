require 'rails_helper'

RSpec.describe Movie, type: :feature do
  describe '#show' do
    it 'display movies information and lists actors form youngest to oldest and has average age' do
      studio1 = Studio.create!(name: 'Paramount', location: 'Hollywood')
      movie1 = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure',
                             studio_id: studio1.id)
      actor1 = Actor.create!(name: 'Bryce Wein', age: 29)
      actor2 = Actor.create!(name: 'Seamore Buuhts', age: 15)
      actor3 = Actor.create!(name: 'Frank Castle', age: 66)
      MovieActor.create!(movie_id: movie1.id, actor_id: actor1.id)
      MovieActor.create!(movie_id: movie1.id, actor_id: actor2.id)
      MovieActor.create!(movie_id: movie1.id, actor_id: actor3.id)

      visit movie_path(movie1)

      within '#info' do
        expect(page).to have_content(movie1.title)
        expect(page).to have_content(movie1.creation_year)
        expect(page).to have_content(movie1.genre)
      end

      within '#actors' do
        expect(actor2.name).to appear_before(actor1.name)
        expect(actor2.name).to appear_before(actor3.name)
        expect(page).to have_content(actor3.name)
      end
    end
  end
end
