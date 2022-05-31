class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.order_by_age
    order(:age)
  end

  def self.average_age
    average(:age)
  end

  def coactors
    movies.joins(actors: :actor_movies).pluck(:name)
  end
end
