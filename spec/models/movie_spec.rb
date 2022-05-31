require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe "instance methods" do
    before :each do
      @mgm = Studio.create!(name: "Metro Goldwyn Mayer", location: "Hollywood")
    
      @seven = @mgm.movies.create!(title: "Seven Brides For Seven Brothers", creation_year: 1954, genre: "Musical")
      @deck = @mgm.movies.create!(title: "Hit The Deck", creation_year: 1955, genre: "Musical")
    
      @jane = Actor.create!(name: "Jane Powell", age: 23)
      @vic = Actor.create!(name: "Vic Damone", age: 25)
      @ann = Actor.create!(name: "Ann Miller", age: 35)
      @howard = Actor.create!(name: "Howard Keel", age: 30)
      
      ActorMovie.create!(actor: @jane, movie: @seven)
      ActorMovie.create!(actor: @jane, movie: @deck)
      ActorMovie.create!(actor: @vic, movie: @deck)
      ActorMovie.create!(actor: @ann, movie: @deck)
      ActorMovie.create!(actor: @howard, movie: @seven)
    end

    describe "#actors_youngest_to_oldest" do
      it "should return list of actors for movie from youngest to oldest" do
        expect(@deck.actors_youngest_to_oldest).to eq([@jane, @vic, @ann])
        expect(@seven.actors_youngest_to_oldest).to eq([@jane, @howard])
      end
    end

    describe "#actors_average_age" do
      it "should return the average age of all actors in the movie" do
        expect(@deck.actors_average_age.round(2)).to eq(27.67)
        expect(@seven.actors_average_age.round(2)).to eq(26.50)
      end
    end
  end
end

