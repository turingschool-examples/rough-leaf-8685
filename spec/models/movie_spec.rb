require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many(:actor_movies)}
    it { should have_many(:actors).through(:actor_movies)}
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:creation_year) }
    it { should validate_presence_of(:genre) }
  end

  describe 'instance methods' do
    describe '#actors_in_movie' do
      it 'returns the names of all the actors in the movie' do
        marvel = Studio.create!(name: "Marvel Studios", location: "Burbank")
        spider = marvel.movies.create!(title: "Spider-Man", creation_year: 2021, genre: "action")
        tom = Actor.create!(name: "Tom Holland", age: 25)
        rob = Actor.create!(name: "Robert Downey Jr", age: 57)
        chris = Actor.create!(name: "Chris Hemsworth", age: 38)
        ActorMovie.create!(movie: spider, actor: tom)
        ActorMovie.create!(movie: spider, actor: rob)
        ActorMovie.create!(movie: spider, actor: chris)

        expect(spider.actors_in_movie).to eq(["Tom Holland", "Robert Downey Jr", "Chris Hemsworth"])
      end
    end
  end

end
