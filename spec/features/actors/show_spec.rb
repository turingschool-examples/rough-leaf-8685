require 'rails_helper'

RSpec.describe 'Actor Show Page' do 
  let!(:actor1) { Actor.create!(name: 'Daveigh Chase', age: 32)}
  let!(:actor2) { Actor.create!(name: 'Miyu Irino', age: 51)}
  let!(:actor3) { Actor.create!(name: 'Mari Natsuki', age: 48)}
  let!(:actor4) { Actor.create!(name: 'Jim Carrey', age: 60)}
  let!(:actor5) { Actor.create!(name: 'Suzanne Pleshette', age: 79)}

  describe 'coactor extension' do 
    it 'shows the actors attributes' do 
      visit "/actors/#{actor1.id}"

      expect(page).to have_content(actor1.name)
      expect(page).to have_content(actor1.age)
      expect(page).to_not have_content(actor4.name)
    end
  end
end