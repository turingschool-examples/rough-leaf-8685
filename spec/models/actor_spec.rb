require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many(:actor_movies) }
    it { should have_many(:movies).through(:actor_movies) }
    it { should have_many(:studios).through(:movies) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end

  let!(:studio1) { Studio.create!(name: 'Dark Castle Entertainment', location: 'Los Angeles, CA') }
  let!(:studio2) { Studio.create!(name: 'Pixar Animation', location: 'Emeryville, CA') }

  let!(:movie1) { studio1.movies.create!(title: 'Rock n Rolla', creation_year: 2008, genre: 'Action/Comedy') }
  let!(:movie2) { studio2.movies.create!(title: 'Monsters, Inc.', creation_year: 2001, genre: 'Animation') }
  let!(:movie3) { studio2.movies.create!(title: 'Up', creation_year: 2009, genre: 'Animation') }

  let!(:actor1) { Actor.create!(name: 'John Goodman', age: 46) }
  let!(:actor2) { Actor.create!(name: 'Eddie Murphey', age: 55) }

  let!(:actor_movie1) { movie2.actor_movies.create!(actor_id: actor1.id) }
  let!(:actor_movie2) { movie2.actor_movies.create!(actor_id: actor2.id) }

  describe "::order_by_age" do
    it "lists actors in order by age" do
      expect(Actor.order_by_age).to eq([actor1, actor2])
    end
  end
  
  describe "::average_age" do
    it "calculates average age of actors" do
      expect(Actor.average_age).to eq(50)
    end
  end
end
