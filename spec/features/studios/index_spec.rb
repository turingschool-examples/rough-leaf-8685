require "rails_helper"

RSpec.describe "Studio Index page" do
  before :each do
    @warner_bros = Studio.create(name: 'Warner Brothers', location: 'Los Angeles')
      @sheep = @warner_bros.movies.create(title: "Sheep", creation_year: 2011,
        genre:"Horror")
      @wolves = @warner_bros.movies.create(title: "Wolves", creation_year: 2012,
        genre:"Horror")
      @bear = @warner_bros.movies.create(title: "Bear", creation_year: 2011,
        genre:"Drama")

    @lionsgate = Studio.create(name: 'Lionsgate', location: 'New York')
      @the_game = @lionsgate.movies.create(title: 'The Game', creation_year: 2015,
        genre: 'Drama')
      @play_time = @lionsgate.movies.create(title: 'Play Time', creation_year: 2012,
        genre: 'Horror')
      @overtime = @lionsgate.movies.create(title: 'Overtime', creation_year: 2013,
        genre: 'Mystery')

    @disney = Studio.create(name: 'Disney', location: 'Orlando')
      @moana = @disney.movies.create(title: 'Moana', creation_year: 2018,
         genre: 'Family')
      @star_wars = @disney.movies.create(title: 'Star Wars', creation_year: 2019,
         genre: 'Action')
      @lion_king = @disney.movies.create(title: 'Lion King', creation_year: 2002,
         genre: 'Family/Action')
  end

  it "displays each studios name" do
    visit "/studios"

    expect(page).to have_content("Disney")
    expect(page).to have_content("Lionsgate")
    expect(page).to have_content("Warner Brothers")
  end

  it "diisplays the names of the movies for each studio" do
    visit "/studios"
    expect(page).to have_content("Warner Brothers")
    expect(page).to have_content("Sheep")
    expect(page).to have_content("Wolves")
    expect(page).to have_content("Bear")

    expect(page).to have_content("Lionsgate")
    expect(page).to have_content("The Game")
    expect(page).to have_content("Play Time")
    expect(page).to have_content("Overtime")

    expect(page).to have_content("Disney")
    expect(page).to have_content("Moana")
    expect(page).to have_content("Lion King")
    expect(page).to have_content("Star Wars")
  end
end
