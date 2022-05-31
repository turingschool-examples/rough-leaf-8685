class Movie < ApplicationRecord
  validates_presence_of :title, :creation_year, :genre
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_average_age
    actors.average(:age)
  end

  def actors_by_age
    actors.order(:age)
  end
end
