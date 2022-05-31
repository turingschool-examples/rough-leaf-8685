require 'rails_helper'

RSpec.describe Actor, type: :feature do
  describe '#show' do
    it 'display actors information and lists actors they have worked with' do
      studio1 = Studio.create!(name: 'Paramount', location: 'Hollywood')
      movie1 = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure',
                             studio_id: studio1.id)
      movie2 = Movie.create!(title: 'Fast 5', creation_year: 2011, genre: 'Action/Adventure',
                             studio_id: studio1.id)
      actor1 = Actor.create!(name: 'Bryce Wein', age: 29)
      actor2 = Actor.create!(name: 'Seamore Buuhts', age: 15)
      actor3 = Actor.create!(name: 'Frank Castle', age: 66)
      actor4 = Actor.create!(name: 'Johny Rockett', age: 22)
      actor5 = Actor.create!(name: 'Steve Bubby', age: 34)
      MovieActor.create!(movie_id: movie1.id, actor_id: actor1.id)
      MovieActor.create!(movie_id: movie2.id, actor_id: actor1.id)
      MovieActor.create!(movie_id: movie1.id, actor_id: actor3.id)
      MovieActor.create!(movie_id: movie1.id, actor_id: actor4.id)
      MovieActor.create!(movie_id: movie2.id, actor_id: actor5.id)

      visit actor_path(actor1)

      within '#info' do
        expect(page).to have_content(actor1.name)
        expect(page).to have_content(actor1.age)
      end

      within '#coactors' do
        expect(page).to_not have_content(actor2.name)
        expect(page).to_not have_content(actor1.name)
        expect(page).to have_content(actor3.name)
        expect(page).to have_content(actor4.name)
        expect(page).to have_content(actor5.name)
      end
    end
  end
end
