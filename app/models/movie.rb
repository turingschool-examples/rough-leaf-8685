class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def all_actors_by_age
    actors.order(:age).pluck(:name)
  end

  def average_age
    actors.average(:age)
  end
end
