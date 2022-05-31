class Actor < ApplicationRecord

  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def coactors
    actor_movie_ids = Movie.joins(:actors).where("actors.id = #{self.id}").pluck(:id)
    actor_ids = ActorMovie.where(movie_id: actor_movie_ids).pluck(:actor_id)
    actors = Actor.where(id: actor_ids).where.not(id: self.id)
  end
end