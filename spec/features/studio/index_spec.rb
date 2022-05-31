require 'rails_helper'

RSpec.describe 'Studio index page' do
  before(:each) do
    universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    jimmy = Studio.create!(name: "Jimbob's Home Movies", location: 'Unknown')
    gocarts = jimmy.movies.create!(name: 'Go-carts', creation_year: 1989, genre: 'Action' )
    fishing = jimmy.movies.create!(name: 'Gone Fishin', creation_year: 1973, genre: 'Rom-com')
    ark = universal.movies.create!(name: 'Raiders of the Lost Ark', creation_year: 1981 , genre: 'Action/Adventure')
    et = universal.movies.create!(name: 'ET', creation_year: 1993, genre: 'Adventure')
  end

  it 'can list all studio names' do
    visit "/studios/index"

    expect(page).to have_content(universal.name)
    expect(page).to have_content(jimmy.name)
  end
end
