class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

    def young_to_old
      actors.order(:age)
    end

    def average_age
      actors.average(:age)
    end
end
