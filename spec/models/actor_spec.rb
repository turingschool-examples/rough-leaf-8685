require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should have_many :actor_movies }
    it { should have_many(:movies).through(:actor_movies) }
  end

  describe "class methods" do
    let!(:doc) { Actor.create!(name: "Christopher Lloyd", age: 83) }
    let!(:marty) { Actor.create!(name: "Michael J. Fox", age: 60) }
    let!(:biff) { Actor.create!(name: "Thomas F. Wilson", age: 63) }
    let!(:indy) { Actor.create!(name: "Harrison Ford", age: 78) }

    it "orders actors by age" do
      expect(Actor.order_by_age).to eq([marty, biff, indy, doc])
    end

    it "calculates the average age of actors" do
      expect(Actor.average_age).to eq(71)
    end
  end

  describe "instance methods" do
    let!(:doc) { Actor.create!(name: "Christopher Lloyd", age: 83) }
    let!(:marty) { Actor.create!(name: "Michael J. Fox", age: 60) }
    let!(:biff) { Actor.create!(name: "Thomas F. Wilson", age: 63) }
    let!(:indy) { Actor.create!(name: "Harrison Ford", age: 78) }
    let!(:universal) { Studio.create!(name: "Universal Studios", location: "Hollywood") }
    let!(:bttf) { Movie.create!(title: "Back to the Future", creation_year: 1985, genre: "Science Fiction", studio: universal) }
    let!(:actor_movie3) { ActorMovie.create!(actor: marty, movie: bttf) }
    let!(:actor_movie4) { ActorMovie.create!(actor: doc, movie: bttf) }
    let!(:actor_movie5) { ActorMovie.create!(actor: biff, movie: bttf) }

    xit "#coactors displays a list of actors a particular actor has worked with" do
      expect(marty.coactors).to eq([doc.name, biff.name])
      expect(doc.coactors).to eq([marty.name, biff.name])
      expect(biff.coactors).to eq([marty.name, doc.name])
    end
  end
end
