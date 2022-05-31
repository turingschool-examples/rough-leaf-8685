class Actor < ApplicationRecord
  validates_presence_of :name, :age

  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.ordered_by_age
    order(:age)
  end

  def self.average_age
    average(:age)
  end

  def coactors
    movies.flat_map {|movie| movie.actors_in_movie}
  end
#haha well...I could not figure out how to do this with active record in time

end
