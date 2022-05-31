class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def find_coactors
    movies.joins(:actors).distinct.order(:name).pluck(:name)
  end
  
end