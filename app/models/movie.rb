class Movie < ApplicationRecord
  validates_presence_of :title, :creation_year, :genre

  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_in_movie
    actors.pluck(:name)
  end
end
