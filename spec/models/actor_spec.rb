require 'rails_helper'

RSpec.describe Actor do 
  describe 'relationships' do 
    it { should have_many :movie_actors}
    it { should have_many(:movies).through(:movie_actors)}
  end

  let!(:actor1) { Actor.create!(name: 'Daveigh Chase', age: 32)}
  let!(:actor2) { Actor.create!(name: 'Miyu Irino', age: 51)}
  let!(:actor3) { Actor.create!(name: 'Mari Natsuki', age: 48)}

  describe 'class methods' do 
    describe 'user story 2 methods' do 
      it '#order_by_age' do
        expect(Actor.order_by_age).to eq([actor1, actor3, actor2])
      end

      it '#average_age' do 
        expect(Actor.average_age).to eq(43.67)
      end
    end
  end
end