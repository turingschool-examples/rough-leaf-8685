require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @jimmy = Studio.create!(name: "Jimbob's Home Movies", location: 'Unknown')
    @gocarts = @jimmy.movies.create!(title: 'Go-carts', creation_year: 1989, genre: 'Action' )
    @fishing = @jimmy.movies.create!(title: 'Gone Fishin', creation_year: 1973, genre: 'Rom-com')
    @ark = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981 , genre: 'Action/Adventure')
    @et = @universal.movies.create!(title: 'ET', creation_year: 1993, genre: 'Adventure')
  end

  it 'can display a movies attributes on the page' do
    visit "/movies/#{@ark.id}"

    expect(page).to have_content(@ark.title)
    expect(page).to have_content(@ark.creation_year)
    expect(page).to have_content(@ark.genre)
    expect(page).to_not have_content(@gocarts.title)

    visit "/movies/#{@fishing.id}"

    expect(page).to have_content(@fishing.title)
    expect(page).to have_content(@fishing.creation_year)
    expect(page).to have_content(@fishing.genre)
    expect(page).to_not have_content(@et.title)
  end
end
