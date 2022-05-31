class Actor < ApplicationRecord

  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def coactors
    actor_movie_ids = Movie.joins(:actors).where("actors.id = #{id}").pluck(:id)
    actors = Actor.joins(:movies).where(movies: { id: actor_movie_ids }).where.not(id: id).distinct
  end
end