require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :actor_movies }
    it { should have_many(:movies).through(:actor_movies) }
  end

  describe 'class methods' do
    it 'can order actors by age, youngest to oldest' do
      jimbob = Actor.create!(name: "Jimbob Himself", age: 65)
      alice = Actor.create!(name: "Alice Wondra", age: 96)
      pete = Actor.create!(name: "Pete Downdaroad", age: 32)
      sam = Actor.create!(name: "Sam Nunya", age: 28)

      cast = Actor.all

      expect(cast.by_youngest).to eq([sam, pete, jimbob, alice])
    end

    it 'can average the age of all actors' do
      jimbob = Actor.create!(name: "Jimbob Himself", age: 65)
      alice = Actor.create!(name: "Alice Wondra", age: 96)
      pete = Actor.create!(name: "Pete Downdaroad", age: 32)
      sam = Actor.create!(name: "Sam Nunya", age: 28)

      cast = Actor.all

      expect(cast.average_age.round(2)).to eq(55.25)
    end

    it 'can find an actor by name' do
      jimbob = Actor.create!(name: "Jimbob Himself", age: 65)
      alice = Actor.create!(name: "Alice Wondra", age: 96)
      pete = Actor.create!(name: "Pete Downdaroad", age: 32)
      sam = Actor.create!(name: "Sam Nunya", age: 28)

      expect(Actor.find_by_name(sam.name)).to eq(sam)
      expect(Actor.find_by_name("Jimbob Himself")).to eq(jimbob)
    end
  end
end
