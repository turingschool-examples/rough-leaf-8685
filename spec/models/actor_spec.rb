require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should have_many(:actor_movies)}
    it { should have_many(:movies).through(:actor_movies)}
  end

  describe 'class variables' do
    it 'can list all actors by ascending age' do
      actor1 = Actor.create!(name: "ActorYoungest", age: 10)
      actor2 = Actor.create!(name: "OldestActor", age: 50)
      actor3 = Actor.create!(name: "LowMiddleActor", age: 20)
      actor4 = Actor.create!(name: "MiddleActor", age: 30)
      actor5 = Actor.create!(name: "HighMiddleActor", age: 40)

      expect(Actor.by_age.all).to eq([actor1, actor3, actor4, actor5, actor2])
  `` end

    it 'can calculate average age of actors' do
      actor1 = Actor.create!(name: "ActorYoungest", age: 10)
      actor2 = Actor.create!(name: "OldestActor", age: 50)
      actor3 = Actor.create!(name: "LowMiddleActor", age: 20)
      actor4 = Actor.create!(name: "MiddleActor", age: 30)
      actor5 = Actor.create!(name: "HighMiddleActor", age: 40)

      expect(Actor.average_age).to eq(30)
    end
  end
end
