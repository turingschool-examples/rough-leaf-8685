class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors
  has_many :actors, through: :movies

  def coactors
    actors.where.not(id: id).distinct.pluck(:name)
  end
end
