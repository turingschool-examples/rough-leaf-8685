class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def age_sort
    actors.order(:age)
  end

  def avg_age
    actors.average(:age).to_f
  end
end
