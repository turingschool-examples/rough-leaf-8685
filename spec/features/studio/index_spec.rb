require 'rails_helper'

RSpec.describe 'studio show page' do 
  let!(:studio1) { Studio.create!(name: "Universal Studios", location: "Hollywood") }
  let!(:studio2) { Studio.create!(name: "Warner Bros.", location: "Hollywood") }

  it 'lists each studios name and location' do 
    visit "/studios"

    expect(page).to have_content(studio1.name)
    expect(page).to have_content(studio1.location)
    expect(page).to have_content(studio2.name)
    expect(page).to have_content(studio2.location)

  end
end