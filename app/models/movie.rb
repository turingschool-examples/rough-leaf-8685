class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_youngest_first
    self.actors.order(:age)
  end

  def actors_average_age
    self.actors.average(:age)
  end
end