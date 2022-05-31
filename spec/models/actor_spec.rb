require 'rails_helper' 

RSpec.describe Actor, type: :model do

    describe "relationships" do
        it { should have_many :actor_movies }
        it { should have_many(:movies).through(:actor_movies) }
    end

    describe "instance methods" do
        before :each do
            @mgm = Studio.create!(name: "Metro Goldwyn Mayer", location: "Hollywood")
            @wb = Studio.create!(name: "Warner Borthers", location: "Los Angeles")
            
            @seven = @mgm.movies.create!(title: "Seven Brides For Seven Brothers", creation_year: 1954, genre: "Musical")
            @deck = @mgm.movies.create!(title: "Hit The Deck", creation_year: 1955, genre: "Musical")
            @melody = @wb.movies.create!(title: "The Broadway Melody of 1940", creation_year: 1940, genre: "Musical")
            @oz = @wb.movies.create!(title: "The Wizard of Oz", creation_year: 1939, genre: "Musical")
            
            @jane = Actor.create!(name: "Jane Powell", age: 23)
            @vic = Actor.create!(name: "Vic Damone", age: 25)
            @ann = Actor.create!(name: "Ann Miller", age: 35)
            @howard = Actor.create!(name: "Howard Keel", age: 30)
            @judy = Actor.create!(name: "Judy Garland", age: 28)
            @ray = Actor.create!(name: "Ray Bolger", age: 38)
            @debbie = Actor.create!(name: "Debbie Reynolds", age: 22) 
            
            ActorMovie.create!(actor: @jane, movie: @seven)
            ActorMovie.create!(actor: @jane, movie: @deck)
            ActorMovie.create!(actor: @vic, movie: @deck)
            ActorMovie.create!(actor: @ann, movie: @deck)
            ActorMovie.create!(actor: @howard, movie: @seven)
            ActorMovie.create!(actor: @judy, movie: @oz)
            ActorMovie.create!(actor: @ray, movie: @oz)
            ActorMovie.create!(actor: @ray, movie: @melody)
        end

        describe "#coactors" do

            it "returns a list of actors an actor has worked with" do
                expect(@jane.coactors).to eq([@vic, @ann, @howard])
                expect(@ray.coactors).to eq([@judy])
            end
        end
    end

end