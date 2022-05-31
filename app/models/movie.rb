class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actor_sort_by_age
    actors.order(age: :asc)
  end

  def avg_age
    actors.average(:age)
  end
end
