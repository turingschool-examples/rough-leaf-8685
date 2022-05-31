require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @jimmy = Studio.create!(name: "Jimbob's Home Movies", location: 'Unknown')
    @gocarts = @jimmy.movies.create!(title: 'Go-carts', creation_year: 1989, genre: 'Action' )
    @fishing = @jimmy.movies.create!(title: 'Gone Fishin', creation_year: 1973, genre: 'Rom-com')
    @ark = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981 , genre: 'Action/Adventure')
    @et = @universal.movies.create!(title: 'ET', creation_year: 1993, genre: 'Adventure')

    @jimbob = Actor.create!(name: "Jimbob Himself", age: 65)
    @alice = Actor.create!(name: "Alice Wondra", age: 96)
    @pete = Actor.create!(name: "Pete Downdaroad", age: 32)
    @sam = Actor.create!(name: "Sam Nunya", age: 28)

    connection1 = ActorMovie.create!(actor_id: @jimbob.id, movie_id: @fishing.id)
    connection2 = ActorMovie.create!(actor_id: @jimbob.id, movie_id: @gocarts.id)
    connection3 = ActorMovie.create!(actor_id: @alice.id, movie_id: @et.id)
    connection4 = ActorMovie.create!(actor_id: @pete.id, movie_id: @gocarts.id)
    connection5 = ActorMovie.create!(actor_id: @pete.id, movie_id: @fishing.id)
    connection6 = ActorMovie.create!(actor_id: @sam.id, movie_id: @gocarts.id)
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

  it 'can list all actors from youngest to oldest' do
    visit "/movies/#{@gocarts.id}"

    expect(page).to have_content(@pete.name)
    expect(page).to have_content(@sam.name)
    expect(page).to have_content(@jimbob.name)

    within '#actorList' do
      expect(page.all('.actors')[0]).to have_content(@sam.name)
      expect(page.all('.actors')[1]).to have_content(@pete.name)
      expect(page.all('.actors')[2]).to have_content(@jimbob.name)
    end
  end
end
