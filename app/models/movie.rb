class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors

  def actors_age
    actors.order(:age)
  end

  def ave_age
    actors.average(:age)
  end
end
