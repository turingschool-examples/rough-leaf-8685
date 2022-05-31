require 'rails_helper'

RSpec.describe Studio do
  describe 'relationships' do
    it { should have_many :movies }
  end

  describe "instance methods" do
    it ".movie_titles" do
      studio_1 = Studio.create!(name: "Super Real Studios", location: "Bollywood")

      movie_1 = studio_1.movies.create!(title: "Bad Movie", creation_year: 1988, genre: "Horror")
      movie_2 = studio_1.movies.create!(title: "Sandy Beach", creation_year: 2001, genre: "Romance")

      expect(studio_1.movie_titles).to eq(["Bad Movie", "Sandy Beach"])
    end
  end
end
