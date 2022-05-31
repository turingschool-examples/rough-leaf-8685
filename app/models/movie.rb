class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_by_age
    actors.order_by_age
  end

  def actors_average_age
    actors.average_age
  end
end
