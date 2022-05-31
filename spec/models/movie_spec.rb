require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe "instance methods" do
    let!(:universal) { Studio.create!(name: "Universal Studios", location: "Hollywood") }
    let!(:bttf) { Movie.create!(title: "Back to the Future", creation_year: 1985, genre: "Science Fiction", studio: universal) }
    let!(:doc) { Actor.create!(name: "Christopher Lloyd", age: 83) }
    let!(:marty) { Actor.create!(name: "Michael J. Fox", age: 60) }
    let!(:biff) { Actor.create!(name: "Thomas F. Wilson", age: 63) }
    let!(:actor_movie3) { ActorMovie.create!(actor: marty, movie: bttf) }
    let!(:actor_movie4) { ActorMovie.create!(actor: doc, movie: bttf) }
    let!(:actor_movie5) { ActorMovie.create!(actor: biff, movie: bttf) }

    it "orders actors in a movie by age" do
      expect(bttf.actors_by_age).to eq([marty, biff, doc])
    end
  end
end
