require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should have_many :movie_actors }
    it { should have_many(:movies).through(:movie_actors) }
    it { should have_many(:actors).through(:movies) }
  end

  describe 'instance methods' do
    it '#coactors' do
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

      expect(actor1.coactors).to eq(['Frank Castle', 'Johny Rockett', 'Steve Bubby'])
    end
  end
end
