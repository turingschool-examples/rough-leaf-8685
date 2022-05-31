require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it {should have_many :movie_actors}
    it {should have_many(:actors).through(:movie_actors)}
  end

  it 'lists actors youngest to oldest' do
    tyler = Studio.create!(name: "Perry Studios", location: 'Atlanta, GA')
    # top_gun = Movie.create!(title: "Top Gun", creation_year: 2020, genre: "action", studio_id: paramount.id)
    # die_harder = Movie.create!(title: "Die Hard 46", creation_year: 1998, genre: "action", studio_id: tyler.id)
    madea = Movie.create!(title: "Madea", creation_year: 2010, genre: "comedy", studio_id: tyler.id)
    tom = Actor.create!(name: "Tom Cruise", age: 50)
    arnold = Actor.create!(name: "Arnold", age: 73)
    MovieActor.create!(movie_id: madea.id, actor_id: tom.id)
    MovieActor.create!(movie_id: madea.id, actor_id: arnold.id)

    expect(madea.actors_age).to eq([tom, arnold])
  end

  it 'calculates the average age of all actors' do
    tyler = Studio.create!(name: "Perry Studios", location: 'Atlanta, GA')
    # top_gun = Movie.create!(title: "Top Gun", creation_year: 2020, genre: "action", studio_id: paramount.id)
    # die_harder = Movie.create!(title: "Die Hard 46", creation_year: 1998, genre: "action", studio_id: tyler.id)
    madea = Movie.create!(title: "Madea", creation_year: 2010, genre: "comedy", studio_id: tyler.id)
    tom = Actor.create!(name: "Tom Cruise", age: 50)
    arnold = Actor.create!(name: "Arnold", age: 73)
    MovieActor.create!(movie_id: madea.id, actor_id: tom.id)
    MovieActor.create!(movie_id: madea.id, actor_id: arnold.id)

    expect(madea.ave_age).to eq(61.50)
  end
end
