require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe 'instance methods' do
    it 'can show all the actors in a movie in order from youngest to oldest' do
      @dis = Studio.create!(name: "Disney", location: "Florida")
      @sw = @dis.movies.create!(title: "Star Wars", creation_year: "1984", genre: "Sci-Fi/Adventure")
      @hf = @sw.actors.create!(name: "Harrison Ford", age: "78")
      @gl = @sw.actors.create!(name: "George Lucas", age: "65")
      @ag = @sw.actors.create!(name: "Alec Guinness", age: "90")
      @np = @sw.actors.create!(name: "Natalie Portman", age: "39")

      expect(@sw.actor_by_age).to eq([@np, @gl, @hf, @ag])
    end
  end
end
