require 'rails_helper'

RSpec.describe Actor, type: :model do
  it { should have_many(:movies).through(:movie_actors) }
  it { should have_many(:movie_actors) }

  let!(:studio1) { Studio.create!(name: "Universal Studios", location: "Hollywood") }

  let!(:movie1) { studio1.movies.create!(title: "Raiders of the Lost Ark", creation_year: 1981, genre: "Action/Adventure") }
  let!(:movie2) { studio1.movies.create!(title: "The Croods: A New Age" , creation_year:  2020, genre: "Family") }

  let!(:actor1) { movie1.actors.create!(name: "Handsome Sam" , age: 33) }
  let!(:actor2) { movie1.actors.create!(name: "Villian Dan", age: 25) }
  let!(:actor3) { movie1.actors.create!(name: "Dame Deloris", age: 22) }

  it 'sorts actors by age' do 
    expect(Actor.sort_by_age.to_a).to eq([actor3, actor2, actor1])
  end

  it 'averages actors age' do 
    expect(Actor.average_age.to_f.round(2)).to eq(26.67)
  end

end
