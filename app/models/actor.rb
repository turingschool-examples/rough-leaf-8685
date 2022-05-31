class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def unique_coworkers
    Actor.joins(:movies).where.not(name: self.name).distinct.pluck(:name).join ", "
  end
end
