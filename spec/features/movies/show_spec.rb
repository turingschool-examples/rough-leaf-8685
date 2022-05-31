require "rails_helper"

RSpec.describe "Movies Show Page" do
  before :each do
    @warner_bros = Studio.create(name: 'Warner Brothers', location: 'Los Angeles')
      @sheep = @warner_bros.movies.create(title: "Sheep", creation_year: 2011,
        genre:"Horror")
      @wolves = @warner_bros.movies.create(title: "Wolves", creation_year: 2012,
        genre:"Horror")
      @bear = @warner_bros.movies.create(title: "Bear", creation_year: 2011,
        genre:"Drama")
        # require "pry"; binding.pry
      @daniel_radcliffe = @sheep.actors.create(name: "Daniel Radclifee", age:32)
      @heath_leger = @sheep.actors.create(name: "Heath Leger", age:38)
      @the_rock = @wolves.actors.create(name: "The Rock", age:42)
  end
  it 'can display the movies information' do
    visit '/movies/1'

    expect(page).to have_content("Sheep")
    expect(page).to have_content("2011")
    expect(page).to have_content("Horror")
  end

  it 'displays the actors that were on the film' do
    expect(page).to have_content("Daniel Radcliffe")
    expect(page).to have_content("Heath Leger")
    expect(page).to not_have_content("Heath Leger")

  end
end
