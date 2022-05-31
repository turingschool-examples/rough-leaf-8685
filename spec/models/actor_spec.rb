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

      expect(cast.average_age.to_f).to eq(55.25)
    end
  end
end
