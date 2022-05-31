class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_age_ascending
    actors.order(:age).pluck(:name).join ', '
  end

  def average_actors_age
    actors.average(:age)
  end
end
