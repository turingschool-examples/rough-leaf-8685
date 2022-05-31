require 'rails_helper'

RSpec.describe Actor do
  describe 'relatioships' do
    it { should have_many :actor_movies }
    it { should have_many(:movies).through(:actor_movies) }
  end

  describe 'class_methods' do
    it 'can order the actors by age descending' do
      mike = Actor.create!(name: "mike myers", age: 22)
      jim = Actor.create!(name: "jim carrey", age: 26)
      steve = Actor.create!(name: "steve harvey", age: 66)

      expect(Actor.oldest_to_youngest).to eq([steve, jim, mike])
    end

    it 'can calculate the average age of all actors in movie' do
      mike = Actor.create!(name: "mike myers", age: 22)
      jim = Actor.create!(name: "jim carrey", age: 26)
      steve = Actor.create!(name: "steve harvey", age: 66)

      expect(Actor.average_age).to eq 38
    end
  end
end
