class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actor_by_age
    actors = Actor.all
    actors.order(:age)
  end
end
