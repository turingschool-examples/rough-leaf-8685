require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many(:actor_movies)}
    it { should have_many(:movies).through(:actor_movies)}
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
  end

  describe 'class methods' do
    describe '.ordered_by_age' do
      it 'orders actors by age' do
        tom = Actor.create!(name: "Tom Holland", age: 25)
        rob = Actor.create!(name: "Robert Downey Jr", age: 57)
        chris = Actor.create!(name: "Chris Hemsworth", age: 38)
        gwen = Actor.create!(name: "Gwyneth Paltrow", age: 49)

        expect(Actor.ordered_by_age).to eq([tom, chris, gwen, rob])
      end
    end
  end
end
