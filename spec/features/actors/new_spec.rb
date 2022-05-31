require 'rails_helper'

RSpec.describe 'Actors #New' do
  it 'can create a new actor' do
    visit '/actors/new'

    fill_in("Name", with: "Johnny")
    fill_in("Age", with: "38")

    click_button("Submit")

    expect(current_path).to eq("/movies/#{Actor.first.id}")
  end
end
