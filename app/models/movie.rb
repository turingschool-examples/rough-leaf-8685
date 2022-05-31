class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def age_sorted_actors
    actors.order(:age)
  end

  def actors_average_age
    actors.average(:age)
  end
end
