require 'rails_helper'

RSpec.describe 'Studio index page' do
  before(:each) do
    @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @jimmy = Studio.create!(name: "Jimbob's Home Movies", location: 'Unknown')
    @gocarts = @jimmy.movies.create!(title: 'Go-carts', creation_year: 1989, genre: 'Action' )
    @fishing = @jimmy.movies.create!(title: 'Gone Fishin', creation_year: 1973, genre: 'Rom-com')
    @ark = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981 , genre: 'Action/Adventure')
    @et = @universal.movies.create!(title: 'ET', creation_year: 1993, genre: 'Adventure')
  end

  it 'can list all studio names' do
    visit "/studios/index"

    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@jimmy.name)
  end

  it "has each studio's movies listed below their name" do
    visit "/studios/index"

    within "##{@universal.id}" do
      expect(page).to have_content(@ark.title)
      expect(page).to have_content(@et.title)
      expect(page).to_not have_content(@gocarts.title)
      expect(page).to_not have_content(@fishing.title)
    end

    within "##{@jimmy.id}" do
      expect(page).to_not have_content(@ark.title)
      expect(page).to_not have_content(@et.title)
      expect(page).to have_content(@gocarts.title)
      expect(page).to have_content(@fishing.title)
    end
  end
end
