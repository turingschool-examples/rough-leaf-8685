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
  end

end
