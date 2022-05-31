class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def coactors
    # require "pry"; binding.pry
    movies.joins(actors: :movies)
  end
end
