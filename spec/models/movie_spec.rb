require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actors }
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :creation_year }
    it { should validate_presence_of :genre }
  end

  describe 'methods' do
    it 'can show average age of actors' do
      studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      movie1 = studio1.movies.create!(title: 'Tomato', creation_year: 1992, genre: 'Horror')
      actor1 = Actor.create!(name: 'Apple', age: 27)
      actor2 = Actor.create!(name: 'Kiwi', age: 43)
      actor3 = Actor.create!(name: 'Blueberry', age: 29)
      MovieActor.create!(movie: movie1, actor: actor1)
      MovieActor.create!(movie: movie1, actor: actor2)
      MovieActor.create!(movie: movie1, actor: actor3)
      expect(movie1.actors_average_age).to eq(33)
    end

    it 'can list actors by age' do
      studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      movie1 = studio1.movies.create!(title: 'Tomato', creation_year: 1992, genre: 'Horror')
      actor1 = Actor.create!(name: 'Apple', age: 27)
      actor2 = Actor.create!(name: 'Kiwi', age: 43)
      actor3 = Actor.create!(name: 'Blueberry', age: 29)
      MovieActor.create!(movie: movie1, actor: actor1)
      MovieActor.create!(movie: movie1, actor: actor2)
      MovieActor.create!(movie: movie1, actor: actor3)
      expect(movie1.actors_by_age).to eq([actor1, actor3, actor2])
    end
  end
end
